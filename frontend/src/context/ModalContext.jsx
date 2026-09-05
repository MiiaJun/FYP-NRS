import { createContext, useContext, useState } from "react";

const ModalContext = createContext(null);

export function ModalProvider({ children }) {
	const [showLoginModal, setShowLoginModal] = useState(false);
	const [showRegisterModal, setShowRegisterModal] = useState(false);

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
		<ModalContext.Provider
			value={{
				showLoginModal,
				showRegisterModal,
				openLogin,
				openRegister,
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