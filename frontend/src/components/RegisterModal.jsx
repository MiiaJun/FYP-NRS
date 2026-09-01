import { useState } from "react";
import "./LoginModal.css";

export default function LoginModal({ onClose, onOpenLogin }) {

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

	const handleSubmit = (e) => {
		e.preventDefault();
		onClose();
	};

	return (
		<div className="login-modal-overlay" onClick={onClose}>
			<div className="login-modal" onClick={(e) => e.stopPropagation()}>
				<h2>Join our community</h2>
				<p>Create a free account to like, comment, bookmark and publish articles</p>

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
						<label htmlFor="username">Email</label>
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