import { createContext, useContext, useState } from "react";

const ModalContext = createContext(null);

export function ModalProvider({ children }) {
	const [showLoginModal, setShowLoginModal] = useState(false);
	const [showRegisterModal, setShowRegisterModal] = useState(false);
	const [showForgotPasswordModal, setShowForgotPasswordModal] = useState(false);

	const openLogin = () => {
		setShowRegisterModal(false);
		setShowForgotPasswordModal(false);
		setShowLoginModal(true);
	};

	const openRegister = () => {
		setShowLoginModal(false);
		setShowForgotPasswordModal(false);
		setShowRegisterModal(true);
	};

	const openForgotPassword = () => {
        setShowLoginModal(false);
        setShowRegisterModal(false);
        setShowForgotPasswordModal(true);
    };

	const closeModals = () => {
		setShowLoginModal(false);
		setShowRegisterModal(false);
		setShowForgotPasswordModal(false);
	};

	return (
		<ModalContext.Provider
			value={{
				showLoginModal,
				showRegisterModal,
				showForgotPasswordModal,
				openLogin,
				openRegister,
				openForgotPassword,
				closeModals,
			}}
		>
			{children}
		</ModalContext.Provider>
	);
}

export function useModal() {
	return useContext(ModalContext);
}