import { useState } from "react";
import api from "../api/axios";
import "./LoginModal.css";

export default function RegisterModal({ onClose, onOpenLogin }) {
	const [error, setError] = useState("");
	const [formData, setFormData] = useState({
		email: "",
		username: "",
		password: "",
	});

	const handleChange = (e) => {
		setFormData((prev) => ({
			...prev,
			[e.target.id]: e.target.value,
		}));
	};

	const handleSubmit = async (e) => {
		e.preventDefault();
		
		setError("");

		try {
			await api.post("/auth/register.php", {
				email: formData.email,
				username: formData.username,
				password: formData.password
			});
			onClose();
		} catch (error) {
			setError(error.response?.data?.message || "Register failed");
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
						<input
							id="email"
							type="email"
							value={formData.email}
							onChange={handleChange}
							placeholder="you@example.com"
							required
						/>
					</div>

					<div className="form-group">
						<label htmlFor="username">Username</label>
						<input
							id="username"
							value={formData.username}
							onChange={handleChange}
							placeholder="Username"
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
							placeholder="At least 8 character"
							required
						/>
					</div>

					<button type="submit" className="login-submit">
						Sign up
					</button>
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