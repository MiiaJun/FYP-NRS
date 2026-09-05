import { X } from "lucide-react";
import "./AISummaryModal.css";

export default function AISummaryModal({ summary, loading, onClose }) {
    return (
        <div className="ai-summary-modal-overlay" onClick={onClose}>
            <div
                className="ai-summary-modal"
                onClick={(e) => e.stopPropagation()}
            >
                <div className="ai-summary-header">
                    <h2>AI Summary</h2>

                    <button
                        className="ai-summary-close"
                        onClick={onClose}
                    >
                        <X size={18} />
                    </button>
                </div>

                {loading ? (
					<p className="ai-summary-loading">
						Generating summary...
					</p>
				) : (
					<p className="ai-summary-text">
						{summary}
					</p>
				)}
            </div>
        </div>
    );
}