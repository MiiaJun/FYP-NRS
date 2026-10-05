import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import ForgotPasswordModal from "./ForgotPasswordModal";
import "./ResetPassword.css";

export default function ResetPassword() {
    const navigate = useNavigate();
    const { showNotification } = useNotification();
    const [error, setError] = useState("");
    const [formData, setFormData] = useState({
        password: "",
        confirmPassword: ""
    });
	const [token] = useState(() =>
		new URLSearchParams(window.location.search).get("token")
	);
	const [invalidToken, setInvalidToken] = useState(!token);
	const [showForgotPassword, setShowForgotPassword] = useState(false);

	useEffect(() => {
		if (window.location.search) {
			navigate("/reset-password", { replace: true });
		}
	}, [navigate]);

    const handleChange = (e) => {
        setFormData(prev => ({
            ...prev,
            [e.target.id]: e.target.value
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");

        if (formData.password !== formData.confirmPassword) {
            setError("Passwords do not match");
            return;
        }

        try {
            const response = await api.post("/auth/resetPassword.php", {
                token,
                password: formData.password
            });

            showNotification(response.data.message, "success");
            navigate("/");
        } catch (error) {
            if (error.response?.data?.code === "INVALID_RESET_TOKEN") {
				setInvalidToken(true);
			}
			setError(
				error.response?.data?.message || "Failed to reset password"
			);
        }
    };

    return (
		<>
			<main className="reset-password">
				<h1>Reset password</h1>

				{invalidToken ? (
					<>
						<p className="error-message">
							Invalid reset link. Request a new link below.
						</p>
						<div className="reset-password-footer">
							<button
								className="request-reset-link"
								onClick={() => setShowForgotPassword(true)}
							>
								Request another reset link
							</button>
						</div>
					</>
				) : (
					<>
						<p>Choose your new password.</p>

						{error && <p className="error-message">{error}</p>}

						<form onSubmit={handleSubmit}>
							<div className="form-group">
								<label htmlFor="password">New password</label>
								<input
									id="password"
									type="password"
									value={formData.password}
									onChange={handleChange}
									placeholder="New password"
									minLength={8}
									pattern="^(?!\s)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\S$).{8,}$"
									title="Password must be at least 8 characters, include an uppercase letter, lowercase letter, and number, and cannot start or end with spaces"
									required
								/>
							</div>

							<div className="form-group">
								<label htmlFor="confirmPassword">
									Confirm new password
								</label>
								<input
									id="confirmPassword"
									type="password"
									value={formData.confirmPassword}
									onChange={handleChange}
									placeholder="Confirm new password"
									required
								/>
							</div>

							<button className="reset-button" type="submit">
								Reset password
							</button>
						</form>
					</>
				)}
				<div className="reset-password-footer">
					<button
						className="request-reset-link"
						onClick={() => navigate("/", { replace: true })}
					>
						Back to home
					</button>
				</div>
			</main>
			{invalidToken && showForgotPassword && (
				<ForgotPasswordModal
					onClose={() => setShowForgotPassword(false)}
					showLogin={false}
				/>
			)}
		</>
    );
}