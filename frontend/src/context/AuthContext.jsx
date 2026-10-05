import { createContext, useContext, useState, useEffect, useCallback } from 'react';
import api from "../api/axios";

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
	const [user, setUser] = useState(null);
	const [isLoading, setIsLoading] = useState(true);
	const [followingUsers, setFollowingUsers] = useState([]);
	const [coinReward, setCoinReward] = useState(null);

	const isLoggedIn = user !== null;

	const refreshFollowing = useCallback(async () => {
		if (!isLoggedIn) {
			return;
		}

		const response = await api.get("/user/getFollowing.php");
		setFollowingUsers(response.data.users);
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
			}}
		>
			{children}
		</AuthContext.Provider>
	);
}

export function useAuth() {
	return useContext(AuthContext);
}