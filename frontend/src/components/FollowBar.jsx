import { useEffect, useState } from "react";
import { NavLink } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { UserPlus } from "lucide-react";
import api from "../api/axios";
import "./FollowBar.css";

export default function FollowBar() {
	const { isLoggedIn } = useAuth();
    const [followingUsers, setFollowingUsers] = useState([]);

	useEffect(() => {
        if (!isLoggedIn) {
            setFollowingUsers([]);
            return;
        }

        api.get("/user/getFollowing.php")
            .then(response => {
                setFollowingUsers(response.data.users);
            })
            .catch(error => {
                console.error(error);
            });
    }, [isLoggedIn]);

	return (
		<section className="follow-bar">
			<div className="follow-bar-title">
				<UserPlus size={30} />
				<span>Following</span>
			</div>

			{followingUsers.map(user => (
				<NavLink
					key={user.user_id}
					to={`/profile/${user.user_id}`}
					className="following-item"
				>
					<img
						className="following-profile-picture"
						src={user.profile_picture || "/default-profile.svg"}
						alt={user.username}
					/>
					<span>{user.username}</span>
				</NavLink>
			))}
		</section>
	);
}