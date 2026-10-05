import { useModal } from "../context/ModalContext";
import LoginModal from "./LoginModal";
import RegisterModal from "./RegisterModal";
import ForgotPasswordModal from "./ForgotPasswordModal";

export default function ModalRoot() {
	const {
        showLoginModal,
        showRegisterModal,
        showForgotPasswordModal,
        openLogin,
        openRegister,
        openForgotPassword,
        closeModals
    } = useModal();

	return (
		<>
			{showLoginModal && (
				<LoginModal
					onClose={closeModals}
					onOpenRegister={openRegister}
					onOpenForgotPassword={openForgotPassword}
				/>
			)}

			{showRegisterModal && (
				<RegisterModal
					onClose={closeModals}
					onOpenLogin={openLogin}
				/>
			)}

			{showForgotPasswordModal && (
                <ForgotPasswordModal
                    onClose={closeModals}
                    onOpenLogin={openLogin}
                />
            )}
		</>
	);
}