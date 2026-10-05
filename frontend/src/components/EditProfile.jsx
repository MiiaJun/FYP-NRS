import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import { Camera } from "lucide-react";
import api from "../api/axios";
import LoadingOverlay from "./LoadingOverlay";
import Loading from "./Loading";
import "./EditProfile.css";

export default function EditProfile() {
	const navigate = useNavigate();
	const { user, isLoggedIn, isLoading, refreshUser } = useAuth();
	const { showNotification } = useNotification();
	const [profilePicturePreview, setProfilePicturePreview] = useState(null);
	const [error, setError] = useState("");
	const [frames, setFrames] = useState([]);
	const [isDetailsLoading, setIsDetailsLoading] = useState(true);

	const [formData, setFormData] = useState({
		username: "",
		bio: "",
		profilePicture: null,
		frameId: ""
	});

	const selectedFrame = frames.find(
		frame => frame.cosmetic_id == formData.frameId
	);

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
			profilePicture: user.profile_picture,
			frameId: ""
		});

		setProfilePicturePreview(user.profile_picture);
	}, [user]);

	useEffect(() => {
		if (!user) {
			return;
		}

		setIsDetailsLoading(true);

		api.get("/user/listMyCosmetic.php")
			.then((response) => {
				const cosmetics = response.data.cosmetics || [];
				setFrames(cosmetics);

				const equippedFrame = cosmetics.find((c) => c.is_equipped);

				setFormData(prev => ({
					...prev,
					frameId: equippedFrame ? String(equippedFrame.cosmetic_id) : ""
				}));
				
			})
			.catch(error =>  {
				showNotification(
					error.response?.data?.message || "Failed to load frames",
					"error"
				);
			})
			.finally(() => {
				setIsDetailsLoading(false);
			});
	}, [user, showNotification]);

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
				profile_picture: profilePictureUrl,
				frame_id: formData.frameId === "" ? null : formData.frameId
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

	if (isLoading || !user || isDetailsLoading) {
		return <Loading />;
	}

	return (
		<main className="edit-profile">
			<h1>Edit profile</h1>

			<form onSubmit={handleSubmit}>
				<div className="edit-profile-content">
					<div className="edit-profile-avatar">
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

						{selectedFrame && (
							<img
								className="edit-profile-frame"
								src={selectedFrame.image_url}
								alt=""
							/>
						)}
					</div>

					<div className="edit-profile-form">
						{error && <p className="error-message">{error}</p>}
						<div className="form-group">
							<label htmlFor="username">Username</label>

							<input
								id="username"
								type="text"
								value={formData.username}
								onChange={handleChange}
								placeholder="Enter your username..."
								minLength={2}
								maxLength={30}
								pattern="^\S.{0,28}\S$"
								title="Username must be 2 to 30 characters and cannot start or end with spaces"
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

						<div className="form-group">
							<label>Profile frame</label>
							<div className="frame-picker">
								<button
									type="button"
									className={`frame-option ${formData.frameId === "" ? "selected" : ""}`}
									onClick={() => setFormData(prev => ({
										...prev,
										frameId: ""
									}))}
								>
									<span className="frame-option-preview">
										<img
											className="frame-option-avatar"
											src={profilePicturePreview || "/default-profile.svg"}
											alt=""
										/>
									</span>
									<span>No frame</span>
								</button>

								{frames.map(frame => (
									<button
										key={frame.cosmetic_id}
										type="button"
										className={`frame-option ${formData.frameId == frame.cosmetic_id ? "selected" : ""}`}
										onClick={() => setFormData(prev => ({
											...prev,
											frameId: frame.cosmetic_id
										}))}
									>
										<span className="frame-option-preview">
											<img
												className="frame-option-avatar"
												src={profilePicturePreview || "/default-profile.svg"}
												alt=""
											/>

											<img
												className="frame-option-frame"
												src={frame.image_url}
												alt=""
											/>
										</span>
										<span>{frame.name}</span>
									</button>
								))}
							</div>
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