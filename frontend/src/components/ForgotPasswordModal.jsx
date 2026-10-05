import { useState } from "react";
import api from "../api/axios";
import "./LoginModal.css";

export default function ForgotPasswordModal({ onClose, onOpenLogin, showLogin = true }) {
    const [email, setEmail] = useState("");
    const [error, setError] = useState("");
    const [message, setMessage] = useState("");

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError("");
        setMessage("");

        try {
            const response = await api.post("/auth/forgotPassword.php", {
                email
            });

            setMessage(response.data.message);
        } catch (error) {
            setError(
                error.response?.data?.message || "Could not request reset link"
            );
        }
    };

    return (
        <div className="login-modal-overlay" onClick={onClose}>
            <div className="login-modal" onClick={(e) => e.stopPropagation()}>
                <h2>Forgot password</h2>
                <p className="login-description">Enter your email to receive a password reset link</p>

                {error && <p className="error-message">{error}</p>}
                {message && <p className="success-message">{message}</p>}

                <form onSubmit={handleSubmit}>
                    <div className="form-group">
                        <label htmlFor="email">Email</label>
                        <input
                            id="email"
                            type="email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            placeholder="you@example.com"
                            required
                        />
                    </div>

                    <button type="submit" className="login-submit">
                        Send reset link
                    </button>
                </form>

                <div className="login-modal-footer">
                    <p className="login-description">
                        Check your inbox and spam folder. Wait 5 minutes before requesting another link.
                    </p>

                    {showLogin && (
						<button className="signup-link" onClick={onOpenLogin}>
							Back to login
						</button>
					)}
                </div>
            </div>
        </div>
    );
}