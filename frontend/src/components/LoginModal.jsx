import { useState } from "react";
import { useAuth } from "../context/AuthContext";
import "./LoginModal.css";

export default function LoginModal({ onClose, onOpenRegister }) {
	const { login } = useAuth();

	const [formData, setFormData] = useState({
		email: "",
		password: "",
	});

	const handleChange = (e) => {
		setFormData((prev) => ({
			...prev,
			[e.target.id]: e.target.value,
		}));
	};

	const handleSubmit = (e) => {
		e.preventDefault();
		// Temporary login until PHP backend is ready
		login({
			user_id: 1,
			username: "TestUser",
			email: formData.email,
			profile_picture: null,
		});
		onClose();
	};

	return (
		<div className="login-modal-overlay" onClick={onClose}>
			<div className="login-modal" onClick={(e) => e.stopPropagation()}>
				<h2>Welcome Back</h2>
				<p>Log in to continue reading, publishing and following your favorite authors</p>

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
						<label htmlFor="password">Password</label>
						<input
							id="password"
							type="password"
							value={formData.password}
							onChange={handleChange}
							placeholder="Enter your password"
							required
						/>
					</div>

					<button type="submit" className="login-submit">
						Log in
					</button>
				</form>
				<div className="login-modal-footer">
					<button className="forgot-password">
						Forgot your password?
					</button>

					<p>
						Don't have an account?
						<button className="signup-link" onClick={onOpenRegister}>
							Sign up
						</button>
					</p>
				</div>
			</div>
		</div>
	);
}