import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { Search, LogIn } from 'lucide-react'
import ProfileMenu from './ProfileMenu';
import './Header.css'

export default function Header() {
	const { user, isLoggedIn, logout, openLogin, openRegister } = useAuth();
	const [showProfileMenu, setShowProfileMenu] = useState(false);
	const navigate = useNavigate();

	const handleLogout = () => {
		logout();
		setShowProfileMenu(false);
	};

	return (
		<header className="header">
			<div className="logo" onClick={() => navigate("/")}>P</div>

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
						<button className="signup-button" onClick={openRegister}>
							Sign up
						</button>

						<button className="login-button" onClick={openLogin}>
							<LogIn size={20} />
							Log in
						</button>
					</>
				)}
			</div>
		</header>
	);
}