import { NavLink } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { UserPlus } from "lucide-react";
import "./FollowBar.css";

export default function FollowBar() {
	const { followingUsers } = useAuth();

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
					<div className="following-avatar">
						<img
							className="following-profile-picture"
							src={user.profile_picture || "/default-profile.svg"}
							alt={user.username}
						/>

						{user.profile_frame_url && (
							<img
								className="following-profile-frame"
								src={user.profile_frame_url}
								alt=""
							/>
						)}
					</div>
					<span>{user.username}</span>
				</NavLink>
			))}
		</section>
	);
}