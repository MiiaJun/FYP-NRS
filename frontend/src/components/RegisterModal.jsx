import { useEffect, useState } from "react";
import api from "../api/axios";
import "./LoginModal.css";

export default function RegisterModal({ onClose, onOpenLogin }) {
	const [error, setError] = useState("");
	const [loading, setLoading] = useState(false);
    const [codeSent, setCodeSent] = useState(false);
    const [verified, setVerified] = useState(false);
    const [cooldown, setCooldown] = useState(0);
	const [formData, setFormData] = useState({
		email: "",
		otp: "",
		username: "",
		password: "",
	});

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
		setFormData((prev) => ({
			...prev,
			[e.target.id]: e.target.value,
		}));
	};

	const sendCode = async () => {
        if (loading || verified || cooldown > 0) {
            return;
        }

        setError("");
		setLoading(true);

        try {
            await api.post("/auth/sendEmailOtp.php", {
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
        if (loading || verified || !codeSent) {
            return;
        }

        setError("");
        setLoading(true);

        try {
            await api.post("/auth/verifyEmailOtp.php", {
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
		if (loading || !verified) {
            return;
        }
		
		setError("");
		setLoading(true);

		try {
			await api.post("/auth/register.php", {
				email: formData.email,
				username: formData.username,
				password: formData.password
			});
			onClose();
		} catch (error) {
			setError(
				error.response?.data?.message || "Register failed"
			);
		} finally {
            setLoading(false);
        }
	};

	return (
		<div className="login-modal-overlay" onClick={onClose}>
			<div className="login-modal" onClick={(e) => e.stopPropagation()}>
				<h2>Join our community</h2>
				<p className="login-description">Create a free account to like, comment, bookmark and publish articles</p>

				{error && <p className="error-message">{error}</p>}

				<form onSubmit={handleSubmit}>
					<div className="form-group">
						<label htmlFor="email">Email</label>
						<div className="input-row">
							<input
								id="email"
								type="email"
								value={formData.email}
								onChange={handleChange}
								placeholder="you@example.com"
								disabled={verified}
								required
							/>
							<button
                                type="button"
                                className="inline-btn"
                                onClick={sendCode}
                                disabled={verified || loading || cooldown > 0}
                            >
                                {cooldown > 0 ? `Resend (${cooldown}s)`
                                    : codeSent ? "Resend" 
										: "Send OTP"
								}
                            </button>
						</div>
					</div>

					{codeSent && (
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

					{verified && (
                        <>
							<div className="form-group">
								<label htmlFor="username">Username</label>
								<input
									id="username"
									value={formData.username}
									onChange={handleChange}
									placeholder="Username"
									minLength={2}
									maxLength={30}
									pattern="^\S.{0,28}\S$"
									title="Username must be 2 to 30 characters and cannot start or end with spaces"
									required
								/>
							</div>

							<div className="form-group">
								<label htmlFor="password">Password</label>
								<input
									id="password"
									type="password"
									value={formData.password}
									onChange={handleChange}
									placeholder="At least 8 characters"
									minLength={8}
									pattern="^(?!\s)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\S$).{8,}$"
									title="Password must be at least 8 characters, include an uppercase letter, lowercase letter, and number, and cannot start or end with spaces"
									required
								/>
							</div>

							<button type="submit" className="login-submit">
								Sign up
							</button>
						</>
					)}
				</form>
				<div className="login-modal-footer">
					<p className="register-message">
						By signing up, you agree to our Terms of Service and Privacy Policy.
					</p>

					<p>
						Already have an account?
						<button className="signup-link" onClick={onOpenLogin}>
							Log in
						</button>
					</p>
				</div>
			</div>
		</div>
	);
}