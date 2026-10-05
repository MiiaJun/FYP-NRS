import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import { getTaskCountdown } from "../utils/date";
import { Coins } from "lucide-react";
import api from "../api/axios";
import Loading from "./Loading";
import "./Tasks.css";

export default function Tasks() {
	const navigate = useNavigate();
	const { user, isLoggedIn, isLoading, refreshUser,showCoinReward } = useAuth();
	const { showNotification } = useNotification();
	const [missions, setMissions] = useState([]);
	const [isTasksLoading, setIsTasksLoading] = useState(true);
	const [claiming, setClaiming] = useState(null);
	const [resetAt, setResetAt] = useState(null);
	const [countdown, setCountdown] = useState("");

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		if (!isLoggedIn) {
			return;
		}

		setIsTasksLoading(true);

		api.get("/user/getMissionStatus.php")
			.then(response => {
				setMissions(response.data.missions);
				setResetAt(response.data.reset_at);
				setCountdown(getTaskCountdown(response.data.reset_at));
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load tasks",
					"error"
				);
			})
			.finally(() => {
				setIsTasksLoading(false);
			});
	}, [isLoggedIn, showNotification]);

	useEffect(() => {
		if (!resetAt || !isLoggedIn) {
			return;
		}

		const resetDate = new Date(resetAt.replace(" ", "T") + "+08:00");

		let refreshing = false;
		let lastAttempt = 0;

		const timer = setInterval(() => {
			setCountdown(getTaskCountdown(resetAt));

			const now = Date.now();

			if (now < resetDate.getTime() || refreshing || now - lastAttempt < 5000) {
				return;
			}

			refreshing = true;
			lastAttempt = now;

			api.get("/user/getMissionStatus.php")
				.then(response => {
					setMissions(response.data.missions);
					setResetAt(response.data.reset_at);
					setCountdown(getTaskCountdown(response.data.reset_at));
				})
				.catch(() => {})
				.finally(() => {
					refreshing = false;
				});
		}, 1000);

		return () => clearInterval(timer);
	}, [resetAt, isLoggedIn]);

	const handleClaim = async (code) => {
		if (claiming !== null) {
			return;
		}

		setClaiming(code);

		try {
			const response = await api.post("/user/claimMission.php", {
				mission_code: code
			});

			setMissions(prev =>
				prev.map(mission =>
					mission.code === code
						? { ...mission, claimed: true, can_claim: false }
						: mission
				)
			);
			await refreshUser();
			showCoinReward(response.data.amount ?? 0);
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to claim reward",
				"error"
			);
		} finally {
			setClaiming(null);
		}
	};

	if (isLoading || !user || isTasksLoading) {
		return <Loading />;
	}

	return (
		<section className="tasks">
			<h1>Daily Tasks</h1>
			<p className="tasks-countdown">Tasks reset in {countdown}</p>

			<div className="tasks-content">
				{missions.map(mission => (
					<div className="task-item" key={mission.code}>
						<div className="task-header">
							<h2>{mission.title}</h2>
							<div className="task-reward">
								<Coins size={18} />
								<span>{mission.reward}</span>
							</div>
						</div>

						<progress
							value={mission.progress}
							max={mission.target}
						/>

						<div className="task-footer">
							<p>{mission.progress}/{mission.target}</p>
							{mission.claimed ? (
								<span className="task-claimed">Claimed</span>
							) : (
								<button
									className="task-claim"
									disabled={!mission.can_claim || claiming !== null}
									onClick={() => handleClaim(mission.code)}
								>
									{claiming === mission.code
										? "Claiming..."
										: mission.can_claim
											? "Claim"
											: "In progress"}
								</button>
							)}
						</div>
					</div>
				))}
			</div>
		</section>
	);
}