import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import LoadingOverlay from "./LoadingOverlay";
import Loading from "./Loading";
import "./EditAccount.css";

export default function EditAccount() {
	const navigate = useNavigate();
	const { user, isLoggedIn, isLoading, refreshUser } = useAuth();
	const { showNotification } = useNotification();
	const [error, setError] = useState("");
	const [isSaving, setIsSaving] = useState(false);
	const [codeSent, setCodeSent] = useState(false);
	const [verified, setVerified] = useState(false);
	const [cooldown, setCooldown] = useState(0);
	const [loading, setLoading] = useState(false);
	const [formData, setFormData] = useState({
		email: "",
		otp: "",
		currentPassword: "",
		newPassword: "",
		confirmPassword: ""
	});

	const emailChanged = formData.email.trim().toLowerCase() !== user?.email;

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		if (!user) {
			return;
		}

		setFormData((previous) => ({
			...previous,
			email: user.email,
		}));
	}, [user]);

	useEffect(() => {
		if (cooldown <= 0) {
			return;
		}
		const timer = setTimeout(() => {
			setCooldown(prev => prev - 1);
		}, 1000);
		return () => clearTimeout(timer);
	}, [cooldown]);

	const handleChange = (e) => {
		setFormData((previous) => ({
			...previous,
			[e.target.id]: e.target.value,
		}));
	};

	const sendCode = async () => {
		if (loading || !emailChanged || verified || cooldown > 0) {
			return;
		}

		setError("");
		setLoading(true);

		try {
			await api.post("/auth/sendChangeEmailOtp.php", {
				email: formData.email
			});

			setCodeSent(true);
			setCooldown(60);
			setFormData(prev => ({
				...prev,
				otp: ""
			}));
		} catch (error) {
			setError(
				error.response?.data?.message || "Could not send code"
			);

			if (error.response?.status === 429) {
				setCodeSent(true);
				setCooldown(60);
			}

			if (error.response?.status === 502) {
				setCooldown(60);
			}
		} finally {
			setLoading(false);
		}
	};

	const verifyCode = async () => {
		if (loading || verified || !codeSent || !emailChanged) {
			return;
		}

		setError("");
		setLoading(true);

		try {
			await api.post("/auth/verifyChangeEmailOtp.php", {
				email: formData.email,
				otp: formData.otp
			});

			setVerified(true);
		} catch (error) {
			setError(
				error.response?.data?.message || "Verification failed"
			);
		} finally {
			setLoading(false);
		}
	};

	const handleSubmit = async (e) => {
		e.preventDefault();
		setError("");
		if (emailChanged && !verified) {
			setError("Please verify your new email before saving");
			return;
		}

		if (formData.newPassword !== formData.confirmPassword) {
			setError("New passwords do not match");
			return;
		}

		setIsSaving(true);

		try {
			const response = await api.post("/user/updateAccount.php", {
				email: formData.email,
				current_password: formData.currentPassword,
				new_password: formData.newPassword,
			});

			await refreshUser();

			showNotification(response.data.message, "success");
			navigate("/profile");
		} catch (error) {
			setError(
				error.response?.data?.message || "Failed to update account"
			);
		} finally {
			setIsSaving(false);
		}
	};

	if (isLoading || !user) {
		return <Loading />;
	}

	return (
		<main className="account-settings">
			<h1>Account settings</h1>

			<form onSubmit={handleSubmit}>
				{error && <p className="error-message">{error}</p>}

				<div className="form-group">
					<label htmlFor="email">Email</label>
					<div className="input-row">
						<input
							id="email"
							type="email"
							value={formData.email}
							onChange={handleChange}
							disabled={verified}
							required
						/>
						{emailChanged && (
							<button
								type="button"
								className="inline-btn"
								onClick={sendCode}
								disabled={verified || loading || cooldown > 0}
							>
								{cooldown > 0 ? `Resend (${cooldown}s)`
									: codeSent ? "Resend"
										: "Send OTP"}
							</button>
						)}
					</div>
				</div>
				
				{emailChanged && codeSent && (
					<div className="form-group">
						<label htmlFor="otp">Verification code</label>
						<div className="input-row">
							<input
								id="otp"
								value={formData.otp}
								onChange={handleChange}
								placeholder="6-digit code"
								inputMode="numeric"
								autoComplete="one-time-code"
								maxLength={6}
								disabled={verified || loading}
							/>
							<button
								type="button"
								className="inline-btn"
								onClick={verifyCode}
								disabled={verified || loading}
							>
								{verified ? "Verified" : "Verify"}
							</button>
						</div>
					</div>
				)}

				<div className="form-group">
					<label htmlFor="currentPassword">Current password</label>
					<input
						id="currentPassword"
						type="password"
						value={formData.currentPassword}
						placeholder="Current Password"
						onChange={handleChange}
						required
					/>
				</div>

				<div className="form-group">
					<label htmlFor="newPassword">New password</label>
					<input
						id="newPassword"
						type="password"
						value={formData.newPassword}
						onChange={handleChange}
						placeholder="New Password"
						minLength={8}
						pattern="^(?!\s)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\S$).{8,}$"
						title="Password must be at least 8 characters, include an uppercase letter, lowercase letter, and number, and cannot start or end with spaces"
					/>
				</div>

				<div className="form-group">
					<label htmlFor="confirmPassword">Confirm new password</label>
					<input
						id="confirmPassword"
						type="password"
						value={formData.confirmPassword}
						placeholder="Confirm Password"
						onChange={handleChange}
					/>
				</div>

				<div className="account-settings-actions">
					<button type="button" onClick={() => navigate("/profile")}>
						Cancel
					</button>

					<button className="save-button" type="submit">
						Save changes
					</button>
				</div>
			</form>
			{isSaving && <LoadingOverlay />}
		</main>
	);
}