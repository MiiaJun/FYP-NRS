import { createContext, useContext, useState, useEffect, useCallback } from 'react';
import { useLocation } from "react-router-dom";
import api from "../api/axios";

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
	const [user, setUser] = useState(null);
	const [isLoading, setIsLoading] = useState(true);
	const [followingUsers, setFollowingUsers] = useState([]);
	const [coinReward, setCoinReward] = useState(null);
	const [hasUnreadNotification, setHasUnreadNotification] = useState(false);
	const [hasClaimableTask, setHasClaimableTask] = useState(false);
	const location = useLocation();

	const isLoggedIn = user !== null;

	const refreshFollowing = useCallback(async () => {
		if (!isLoggedIn) {
			return;
		}

		const response = await api.get("/user/getFollowing.php");
		setFollowingUsers(response.data.users);
	}, [isLoggedIn]);

	const refreshNotificationStatus = useCallback(async () => {
		if (!isLoggedIn) {
			return;
		}

		const response = await api.get("/user/getNotificationStatus.php");
		setHasUnreadNotification(response.data.has_unread);
	}, [isLoggedIn]);

	const refreshTaskStatus = useCallback(async () => {
		if (!isLoggedIn) {
			return;
		}

		const response = await api.get("/user/getMissionStatus.php");

		setHasClaimableTask(
			response.data.missions.some(mission => mission.can_claim)
		);
	}, [isLoggedIn]);

	useEffect(() => {
		api.get("/auth/me.php")
			.then(response => {
				setUser(response.data.user);
			})
			.catch(() => {
				setUser(null);
			}).finally(() => {
				setIsLoading(false);
			});
	}, []);

	useEffect(() => {
		refreshFollowing().catch(() => {});
	}, [refreshFollowing]);

	useEffect(() => {
		if (!isLoggedIn) {
			return;
		}

		const checkNotificationStatus = () => {
			if (document.visibilityState === "visible") {
				refreshNotificationStatus().catch(() => {});
			}
		};

		checkNotificationStatus();

		const interval = setInterval(checkNotificationStatus, 300000);

		window.addEventListener("focus", checkNotificationStatus);

		return () => {
			clearInterval(interval);
			window.removeEventListener("focus", checkNotificationStatus);
		};
	}, [location.pathname, isLoggedIn, refreshNotificationStatus]);

	useEffect(() => {
		refreshTaskStatus().catch(() => {});
	}, [refreshTaskStatus]);

	const login = async (email, password) => {
		const response = await api.post("/auth/login.php", {
			email,
			password
		});

		setUser(response.data.user);
	};

	const logout = async () => {
		try {
			await api.post("/auth/logout.php");
		} finally {
			setUser(null);
			setFollowingUsers([]);
			setCoinReward(null);
			setHasUnreadNotification(false);
			setHasClaimableTask(false);
		}
	};

	const refreshUser = async () => {
		try {
			const response = await api.get("/auth/me.php");
			setUser(response.data.user);
		} catch (error) {
			if (error.response?.status === 401 || error.response?.status === 403) {
				setUser(null);
				setFollowingUsers([]);
				setCoinReward(null);
				setHasUnreadNotification(false);
				setHasClaimableTask(false);
			}
			throw error;
		}
	};

	const showCoinReward = useCallback((amount) => {
		if (amount === 0) {
			return;
		}

		setCoinReward({
			amount,
			id: Date.now()
		});
	}, []);

	const clearCoinReward = useCallback(() => {
		setCoinReward(null);
	}, []);

	return (
		<AuthContext.Provider
			value={{
				user,
				isLoggedIn,
				isLoading,
				login,
				logout,
				refreshUser,
				followingUsers,
				refreshFollowing,
				coinReward,
				showCoinReward,
				clearCoinReward,
				hasUnreadNotification,
				refreshNotificationStatus,
				hasClaimableTask,
				refreshTaskStatus,
			}}
		>
			{children}
		</AuthContext.Provider>
	);
}

export function useAuth() {
	return useContext(AuthContext);
}