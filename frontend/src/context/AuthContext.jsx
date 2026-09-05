import { createContext, useContext, useState, useEffect } from 'react';
import api from "../api/axios";

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
	const [user, setUser] = useState(null);
	const [isLoading, setIsLoading] = useState(true);

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
		}
	};

	const isLoggedIn = user !== null;

	return (
		<AuthContext.Provider
			value={{
				user,
				isLoggedIn,
				isLoading,
				login,
				logout,
			}}
		>
			{children}
		</AuthContext.Provider>
	);
}

export function useAuth() {
	return useContext(AuthContext);
}