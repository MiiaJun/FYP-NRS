import { createContext, useContext, useState } from 'react';
import LoginModal from "../components/LoginModal";
import RegisterModal from "../components/RegisterModal";

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
	const [user, setUser] = useState(null);
	const [showLoginModal, setShowLoginModal] = useState(false);
	const [showRegisterModal, setShowRegisterModal] = useState(false);

	const login = (userData) => {
		setUser(userData);
	};

	const logout = () => {
		setUser(null);
	};

	const isLoggedIn = user !== null;

	const openLogin = () => {
		setShowRegisterModal(false);
		setShowLoginModal(true);
	};

	const openRegister = () => {
		setShowLoginModal(false);
		setShowRegisterModal(true);
	};

	const closeModals = () => {
		setShowLoginModal(false);
		setShowRegisterModal(false);
	};

	return (
		<AuthContext.Provider
			value={{
				user,
				isLoggedIn,
				login,
				logout,
				openLogin,
				openRegister,
			}}
		>
			{children}

			{showLoginModal && (
				<LoginModal
					onClose={closeModals}
					onOpenRegister={openRegister}
				/>
			)}

			{showRegisterModal && (
				<RegisterModal
					onClose={closeModals}
					onOpenLogin={openLogin}
				/>
			)}
		</AuthContext.Provider>
	);
}

export function useAuth() {
	return useContext(AuthContext);
}