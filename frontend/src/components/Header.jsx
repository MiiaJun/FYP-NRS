import { useState } from 'react';
import { useAuth } from "../context/AuthContext";
import { Search, LogIn } from 'lucide-react'
import './Header.css'
import ProfileMenu from './ProfileMenu';
import LoginModal from './LoginModal';
import RegisterModal from './RegisterModal'

export default function Header() {
	const { user, isLoggedIn, login, logout } = useAuth();
	const [showProfileMenu, setShowProfileMenu] = useState(false);
	const [showLoginModal, setShowLoginModal] = useState(false);
	const [showRegisterModal, setShowRegisterModal] = useState(false);

	const handleLogout = () => {
		logout();
		setShowProfileMenu(false);
	};

	return (
		<header className="header">
			<div className="logo">P</div>

			<div className="search">
				<Search size={20} />
				<input type="text" placeholder="Search" />
			</div>

			<div className="header-actions">
				{isLoggedIn ? (
					<div className="header-profile">
						<img
							src={user.profile_picture || "/default-profile.svg"}
							alt="Profile"
							className="header-profile-picture"
							onClick={() => setShowProfileMenu(!showProfileMenu)}
						/>

						{showProfileMenu && (
							<ProfileMenu onLogout={handleLogout} />
						)}
					</div>
				) : (
					<>
						<button className="signup-button" onClick={() => setShowRegisterModal(true)}>
							Sign up
						</button>

						<button className="login-button" onClick={() => setShowLoginModal(true)}>
							<LogIn size={20} />
							Log in
						</button>

						{showLoginModal && (
							<LoginModal 
								onClose={() => setShowLoginModal(false)} 
								onOpenRegister={() => {
									setShowLoginModal(false);
									setShowRegisterModal(true);
								}}
							/>
						)}

						{showRegisterModal && (
							<RegisterModal 
								onClose={() => setShowRegisterModal(false)} 
								onOpenLogin={() => {
									setShowLoginModal(true);
									setShowRegisterModal(false);
								}}
							/>
						)}
					</>
				)}
			</div>
		</header>
	);
}