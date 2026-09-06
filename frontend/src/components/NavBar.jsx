import { NavLink } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useModal } from "../context/ModalContext";
import { House, UserRoundPen, Bell, Bookmark, NotebookPen } from "lucide-react";
import "./NavBar.css";

export default function NavBar() {
	const { isLoggedIn } = useAuth();
    const { openLogin } = useModal();

	const handleLoginClick = (e) => {
        if (!isLoggedIn) {
            e.preventDefault();
            openLogin();
        }
    };

	return (
		<nav className="navbar">
			<NavLink to="/" className="navbar-item">
			<House size={30} />
			<span>Home</span>
			</NavLink>

			<NavLink to="/profile" className="navbar-item"  onClick={handleLoginClick}>
			<UserRoundPen size={30} />
			<span>Profile</span>
			</NavLink>

			<NavLink to="/notification" className="navbar-item" onClick={handleLoginClick}>
			<Bell size={30} />
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