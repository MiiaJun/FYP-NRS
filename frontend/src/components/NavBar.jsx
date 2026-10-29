import { NavLink } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useModal } from "../context/ModalContext";
import { House, UserRoundPen, Bell, Bookmark, NotebookPen, ListChecks, ShieldUser } from "lucide-react";
import "./NavBar.css";

export default function NavBar() {
	const { user, isLoggedIn, hasUnreadNotification, hasClaimableTask } = useAuth();
    const { openLogin } = useModal();

	const handleLoginClick = (e) => {
        if (!isLoggedIn) {
            e.preventDefault();
            openLogin();
        }
    };

	return (
		<nav className="navbar">
			{user?.role_id == 2 && (
				<NavLink to="/admin" className="navbar-item">
					<ShieldUser size={30} />
					<span>Admin</span>
				</NavLink>
			)}
			
			<NavLink to="/" className="navbar-item">
				<House size={30} />
				<span>Home</span>
			</NavLink>

			<NavLink to="/profile" className="navbar-item"  onClick={handleLoginClick}>
				<UserRoundPen size={30} />
				<span>Profile</span>
			</NavLink>

			<NavLink to="/tasks" className="navbar-item"  onClick={handleLoginClick}>
				<span className="navbar-icon">
					<ListChecks
						size={30}
						className={isLoggedIn && hasClaimableTask ? "notification-shake" : ""}
					/>
					{isLoggedIn && hasClaimableTask && (
						<span className="navbar-alert-dot" />
					)}
				</span>
				<span>Tasks</span>
			</NavLink>

			<NavLink to="/notification" className="navbar-item" onClick={handleLoginClick}>
				<span className="navbar-icon">
					<Bell
						size={30}
						className={isLoggedIn && hasUnreadNotification ? "notification-shake" : ""}
					/>
					{isLoggedIn && hasUnreadNotification && (
						<span className="navbar-alert-dot" />
					)}
				</span>
				<span>Notification</span>
			</NavLink>

			<NavLink to="/bookmark" className="navbar-item" onClick={handleLoginClick}>
				<Bookmark size={30} />
				<span>Bookmarks</span>
			</NavLink>

			<NavLink to="/create" className="navbar-item" onClick={handleLoginClick}>
				<NotebookPen size={30} />
				<span>Create</span>
			</NavLink>
		</nav>
	);
}