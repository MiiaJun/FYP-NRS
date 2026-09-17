import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import { Camera } from "lucide-react";
import api from "../api/axios";
import LoadingOverlay from "./LoadingOverlay";
import "./EditProfile.css";

export default function EditProfile() {
	const navigate = useNavigate();
	const { user, isLoggedIn, isLoading, refreshUser } = useAuth();
	const { showNotification } = useNotification();
	const [profilePicturePreview, setProfilePicturePreview] = useState(null);
	const [error, setError] = useState("");

	const [formData, setFormData] = useState({
		username: "",
		bio: "",
		profilePicture: null
	});

	const [isSaving, setIsSaving] = useState(false);

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		return () => {
			if (profilePicturePreview?.startsWith("blob:")) {
				URL.revokeObjectURL(profilePicturePreview);
			}
		};
	}, [profilePicturePreview]);

	useEffect(() => {
		if (!user) {
			return;
		}

		setFormData({
			username: user.username,
			bio: user.bio,	
			profilePicture: user.profile_picture
		});

		setProfilePicturePreview(user.profile_picture);
	}, [user]);

	const handleChange = (e) => {
		setFormData((prev) => ({
			...prev,
			[e.target.id]: e.target.value,
		}));
	};

	const handleProfilePictureChange = (e) => {
		const file = e.target.files[0];

		if (file) {
			if (profilePicturePreview?.startsWith("blob:")) {
				URL.revokeObjectURL(profilePicturePreview);
			}

			setFormData((prev) => ({
				...prev,
				profilePicture: file,
			}));

			setProfilePicturePreview(URL.createObjectURL(file));
		}
	};

	const uploadProfilePic = async (profilePicture) => {
		if (!profilePicture) {
			return null;
		}

		if (typeof profilePicture === "string") {
			return profilePicture;
		}

		const data = new FormData();
		data.append("upload", profilePicture);

		const response = await api.post(
			"/user/uploadProfilePic.php",
			data
		);

		return response.data.url;
	};

	const saveProfile = async () => {
		try {
			const profilePictureUrl = await uploadProfilePic(formData.profilePicture);

			const response = await api.post("/user/updateProfile.php", {
				username: formData.username,
				bio: formData.bio,
				profile_picture: profilePictureUrl
			});

			await refreshUser();

			showNotification(response.data.message, "success");

			navigate("/profile");
		} catch (error) {
			if (error.response?.status === 409) {
				setError(error.response.data.message);
				return;
			}
			showNotification(
				error.response?.data?.message || "Failed to update profile",
				"error"
			);
		}
	};

	const handleSubmit = async (e) => {
		e.preventDefault();

		setError("");
		setIsSaving(true);

		try {
			await saveProfile();
		} finally {
			setIsSaving(false);
		}
	};

	if (isLoading || !user)  {
		return <div>Loading...</div>;
	}

	return (
		<main className="edit-profile">
			<h1>Edit profile</h1>

			<form onSubmit={handleSubmit}>
				<div className="edit-profile-content">
					<label className="profile-picture-upload">
						<input
							type="file"
							accept="image/jpeg,image/png,image/webp"
							hidden
							onChange={handleProfilePictureChange}
						/>

						<img
							src={profilePicturePreview || "/default-profile.svg"}
							alt="Profile preview"
						/>

						<div className="profile-picture-camera">
							<Camera size={28} />
						</div>
					</label>

					<div className="edit-profile-form">
						{error && <p className="error-message">{error}</p>}
						<div className="form-group">
							<label htmlFor="username">Username</label>

							<input
								id="username"
								type="text"
								value={formData.username}
								onChange={handleChange}
								maxLength={30}
								placeholder="Enter your username..."
								required
							/>
						</div>

						<div className="form-group">
							<label htmlFor="bio">Bio</label>

							<textarea
								id="bio"
								value={formData.bio}
								onChange={handleChange}
								maxLength={160}
								placeholder="Tell us a little about yourself..."
								rows="5"
							/>

							<span className="bio-character-count">
								{formData.bio.length}/160
							</span>
						</div>

						<div className="edit-profile-actions">
							<button
								type="button"
								onClick={() => navigate("/profile")}
							>
								Cancel
							</button>

							<button className="save-button" type="submit">
								Save Changes
							</button>
						</div>
					</div>
				</div>
			</form>

			{isSaving && (
				<LoadingOverlay />
			)}
		</main>
	);
}