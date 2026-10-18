import { useState } from "react";
import "./ReportModal.css";

const reasons = [
	"Spam",
	"Misleading information",
	"Harassment",
	"Hate speech",
	"Inappropriate content"
];

export default function ReportModal({ isArticle = true, onConfirm, onClose }) {
	const [reason, setReason] = useState("");
	const [isSubmitting, setIsSubmitting] = useState(false);

	const handleSubmit = async e => {
		e.preventDefault();

		if (!reason || isSubmitting) {
			return;
		}

		setIsSubmitting(true);

		try {
			const success = await onConfirm(reason);

			if (success) {
				onClose();
			}
		} finally {
			setIsSubmitting(false);
		}
	};

	return (
		<div
			className="report-modal-overlay"
			onClick={() => {
				if (!isSubmitting) {
					onClose();
				}
			}}
		>
			<div
				className="report-modal"
				onClick={e => e.stopPropagation()}
			>
				<h2>Report {isArticle ? "article" : "comment"}</h2>

				<p className="report-description">
					Select the reason for your report.
				</p>

				<form onSubmit={handleSubmit}>
					<div className="report-reasons">
						{reasons.map(item => (
							<label className="report-reason" key={item}>
								<input
									type="radio"
									name="reason"
									value={item}
									checked={reason === item}
									onChange={e => setReason(e.target.value)}
									required
								/>
								{item}
							</label>
						))}
					</div>

					<div className="report-buttons">
						<button
							type="button"
							className="report-cancel"
							onClick={onClose}
							disabled={isSubmitting}
						>
							Cancel
						</button>

						<button
							type="submit"
							className="report-submit"
							disabled={isSubmitting || !reason}
						>
							Submit report
						</button>
					</div>
				</form>
			</div>
		</div>
	);
}