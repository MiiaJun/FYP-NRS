import { useModal } from "../context/ModalContext";
import LoginModal from "./LoginModal";
import RegisterModal from "./RegisterModal";

export default function ModalRoot() {
	const {
		showLoginModal,
		showRegisterModal,
		openLogin,
		openRegister,
		closeModals
	} = useModal();

	return (
		<>
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
		</>
	);
}