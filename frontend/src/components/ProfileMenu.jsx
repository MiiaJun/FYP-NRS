import { Link } from 'react-router-dom';
import './ProfileMenu.css';

export default function ProfileMenu({ onLogout }) {
	return (
		<div className="profile-menu">
			<Link to="/profile">Profile</Link>
			<Link to="/settings">Account Settings</Link>
			<button onClick={onLogout}>Log out</button>
		</div>
	);
}