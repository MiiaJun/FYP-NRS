import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import { getTimeAgo } from "../utils/date";
import api from "../api/axios";
import Loading from "./Loading";
import "./NotificationList.css";

export default function NotificationList() {
	const navigate = useNavigate();
	const { isLoggedIn, isLoading  } = useAuth();
	const { showNotification } = useNotification();
	const [notifications, setNotifications] = useState([]);
	const [isNotificationLoading, setIsNotificationLoading] = useState(true);

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);
	
	useEffect(() => {
		if (!isLoggedIn) {
			return;
		}

		setIsNotificationLoading(true);

		api.get("/user/listNotification.php")
			.then(response => {
				setNotifications(response.data.notifications);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load notifications",
					"error"
				);
			})
			.finally(() => {
				setIsNotificationLoading(false);
			});
	}, [isLoggedIn, showNotification]);

	const handleNotificationClick = (articleId) => {
		if (articleId) {
			navigate(`/article/${articleId}`);
		}
	};

	return (
		<div className="notification-page">
			<h1>Notifications</h1>

			<div className="notification-content">
				{isNotificationLoading ? (
					<Loading />
				) : notifications.length === 0 ? (
					<p className="notification-empty">No notifications</p>
				) : (
					notifications.map((notification) => (
						<div
							className={`notification-item ${notification.is_read == 0 ? "unread" : ""}`}
							key={notification.notification_id}
							onClick={() => handleNotificationClick(notification.article_id)}
						>
							<p>
								<b
									onClick={(e) => {
										e.stopPropagation();
										navigate(`/profile/${notification.actor_id}`);
									}}
								>
									{notification.actor_username}
								</b> {notification.message}
							</p>
							<span>{getTimeAgo(notification.created_at)}</span>
						</div>
					))
				)}
			</div>
		</div>
	);
}