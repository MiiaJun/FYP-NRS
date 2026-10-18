import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { ChevronLeft, ChevronRight, Newspaper, MessageCircle, UserPlus, TriangleAlert, Ban } from "lucide-react";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import { getTimeAgo } from "../utils/date";
import api from "../api/axios";
import Loading from "./Loading";
import "./NotificationList.css";

const notificationIcons = {
	1: <Newspaper size={20} />,
	2: <Newspaper size={20} />,
	3: <TriangleAlert size={20} />,
	4: <Ban size={20} />,
	5: <MessageCircle size={20} />,
	6: <MessageCircle size={20} />,
	7: <UserPlus size={20} />
};

export default function NotificationList() {
	const navigate = useNavigate();
	const { isLoggedIn, isLoading } = useAuth();
	const { showNotification } = useNotification();
	const [notifications, setNotifications] = useState([]);
	const [isNotificationLoading, setIsNotificationLoading] = useState(true);
	const [isMarkingRead, setIsMarkingRead] = useState(false);
	const [activeTab, setActiveTab] = useState("unread");
	const [page, setPage] = useState(1);
	const [pagination, setPagination] = useState(null);
	const [refreshCount, setRefreshCount] = useState(0);

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		if (!isLoggedIn) {
			return;
		}

		const controller = new AbortController();
		setIsNotificationLoading(true);

		api.get(
			`/user/listNotification.php?page=${page}&tab=${activeTab}`,
			{ signal: controller.signal }
		)
			.then(response => {
				if (response.data.notifications.length === 0 && page > 1) {
					setPage(prev => prev - 1);
					return;
				}

				setNotifications(response.data.notifications);
				setPagination(response.data.pagination);
			})
			.catch(error => {
				if (controller.signal.aborted) {
					return;
				}

				showNotification(
					error.response?.data?.message || "Failed to load notifications",
					"error"
				);
			})
			.finally(() => {
				if (!controller.signal.aborted) {
					setIsNotificationLoading(false);
				}
			});

		return () => controller.abort();
	}, [isLoggedIn, activeTab, page, refreshCount, showNotification]);

	const handleTabChange = tab => {
		setActiveTab(tab);
		setPage(1);
	};

	const handleNotificationClick = async notification => {
		try {
			if (notification.is_read == 0) {
				await api.post("/user/markNotificationRead.php", {
					notification_id: notification.notification_id
				});

				setRefreshCount(prev => prev + 1);
			}
		} catch (error) {}

		if (notification.article_id) {
			const hash = notification.comment_id
				? `#comment-${notification.comment_id}`
				: "";

			navigate(`/article/${notification.article_id}${hash}`);
		} else if (notification.type == 7) {
			navigate(`/profile/${notification.actor_id}`);
		}
	};

	const handleMarkAllRead = async () => {
		if (isMarkingRead) {
			return;
		}

		setIsMarkingRead(true);

		try {
			await api.post("/user/markNotificationRead.php", {});

			setPage(1);
			setRefreshCount(prev => prev + 1);
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to mark notifications as read",
				"error"
			);
		} finally {
			setIsMarkingRead(false);
		}
	};

	if (isLoading || !isLoggedIn || isNotificationLoading) {
		return <Loading />;
	}

	return (
		<div className="notification-page">
			<h1>Notifications</h1>

			<div className="notification-tabs">
				<button
					className={activeTab === "unread" ? "active" : ""}
					onClick={() => handleTabChange("unread")}
				>
					Unread
				</button>

				<button
					className={activeTab === "read" ? "active" : ""}
					onClick={() => handleTabChange("read")}
				>
					Read
				</button>
			</div>

			<div className="notification-content">
				{notifications.length === 0 ? (
					<p className="notification-empty">
						{activeTab === "unread"
							? "No unread notifications"
							: "No notifications"}
					</p>
				) : (
					<>
						{activeTab === "unread" && (
							<button
								className="notification-read-all"
								onClick={handleMarkAllRead}
								disabled={isMarkingRead}
							>
								{isMarkingRead ? "Marking..." : "Mark all as read"}
							</button>
						)}

						{notifications.map(notification => (
							<div
								className={`notification-item notification-type-${notification.type}`}
								key={notification.notification_id}
								onClick={() => handleNotificationClick(notification)}
							>
								<div className="notification-icon">
									{notificationIcons[notification.type]}
								</div>

								<div className="notification-text">
									<p>
										{notification.event_count == 1 && (
											<b
												onClick={e => {
													e.stopPropagation();
													navigate(`/profile/${notification.actor_id}`);
												}}
											>
												{notification.actor_username}
											</b>
										)} {notification.message}
									</p>

									<span>{getTimeAgo(notification.created_at)}</span>
								</div>
							</div>
						))}
					</>
				)}
			</div>

			{pagination && (page > 1 || pagination.has_more) && (
				<div className="notification-pagination">
					<button
						onClick={() => setPage(prev => prev - 1)}
						disabled={page === 1}
					>
						<ChevronLeft size={18} />
					</button>

					<button
						onClick={() => setPage(prev => prev + 1)}
						disabled={!pagination.has_more}
					>
						<ChevronRight size={18} />
					</button>
				</div>
			)}
		</div>
	);
}