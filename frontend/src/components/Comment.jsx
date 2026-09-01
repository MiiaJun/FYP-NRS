import { useState } from "react";
import { useAuth } from "../context/AuthContext";
import { ThumbsUp, ThumbsDown } from "lucide-react";
import "./Comment.css";

export default function Comment({ comment, repliesByParent, onReply, onEditComment }) {
	const [reaction, setReaction] = useState(null);
	const [showReply, setShowReply] = useState(false);
	const [replyText, setReplyText] = useState("");
	const { user, isLoggedIn, openLogin } = useAuth();
	const [editing, setEditing] = useState(false);
	const [editText, setEditText] = useState(comment.content);

	const replies = repliesByParent[comment.comment_id] ?? [];

	const handleReplyChange = (e) => {
		setReplyText(e.target.value);

		e.target.style.height = "24px";
		e.target.style.height = `${e.target.scrollHeight}px`;
	};

	const handleEditChange = (e) => {
		setEditText(e.target.value);

		e.target.style.height = "24px";
		e.target.style.height = `${e.target.scrollHeight}px`;
	};

	const handleLike = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setReaction(
			reaction === "like" ? null : "like"
		);
	};

	const handleDislike = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setReaction(
			reaction === "dislike" ? null : "dislike"
		);
	};

	const handleReply = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setShowReply(true);
	};

	const handleSubmit = (e) => {
		e.preventDefault();

		if (!replyText.trim()) {
			return;
		}

		// POST to PHP later
		const newReply = {
			comment_id: Date.now(),
			user_id: 1,
			username: "John",
			profile_picture: null,
			content: replyText,
			created_at: "1 September 2026",
			parent_comment_id: comment.comment_id,
			like_count: 0,
			dislike_count: 0
		};

		onReply(newReply);

		setReplyText("");
		setShowReply(false);
	};

	const handleSubmitEdit = (e) => {
		e.preventDefault();

		if (!editText.trim()) {
			return;
		}

		// Update comment later through API
		const updatedComment = {
			...comment,
			content: editText
		};

		onEditComment(updatedComment);

		setEditing(false);
	};

	return (
		<div className="comment">
			<img
				className="comment-profile-picture"
				src={comment.profile_picture || "/default-profile.svg"}
				alt={comment.username}
			/>

			<div className="comment-main">
				<div className="comment-user">
					<b>{comment.username}</b>
					<span>•</span>
					<b>{comment.created_at}</b>
				</div>

				{editing ? (
					<form className="edit-form" onSubmit={handleSubmitEdit}>
						<textarea
							value={editText}
							onChange={handleEditChange}
						/>

						<div className="edit-form-actions">
							<button
								type="button"
								className="edit-cancel"
								onClick={() => {
									setEditText(comment.content);
									setEditing(false);
								}}
							>
								Cancel
							</button>

							<button type="submit" className="edit-save">
								Save
							</button>
						</div>
					</form>
				) : (
					<p className="comment-content">
						{comment.content}
					</p>
				)}

				<div className="comment-actions">
					<button
						className={reaction === "like" ? "active" : ""}
						onClick={handleLike}
					>
						<ThumbsUp size={18} />
					</button>

					<span>{comment.like_count}</span>

					<button
						className={reaction === "dislike" ? "active" : ""}
						onClick={handleDislike}
					>
						<ThumbsDown size={18} />
					</button>

					<button
						className="reply-button"
						onClick={handleReply}
					>
						Reply
					</button>

					{isLoggedIn && comment.user_id === user?.user_id ? (
						<>
							<button className="edit-button" onClick={() => setEditing(true)}>
								Edit
							</button>

							<button className="delete-button">
								Delete
							</button>
						</>
					) : (
						<button className="report-button">
							Report
						</button>
					)}
				</div>
				{showReply && (
					<form className="reply-form" onSubmit={handleSubmit}>
						<textarea 
							value={replyText}
							onChange={handleReplyChange} 
						/>
						<div className="reply-form-actions">
						<button
							type="button"
							className="reply-cancel"
							onClick={() => {
								setShowReply(false);
								setReplyText("");
							}}
						>
							Cancel
						</button>

						<button type="submit" className="reply-submit">
							Reply
						</button>
					</div>
					</form>
				)}
				{replies.length > 0 && (
					<div className="comment-replies">
						{replies.map(reply => (
							<Comment
								key={reply.comment_id}
								comment={reply}
								repliesByParent={repliesByParent}
								onReply={onReply}
								onEditComment={onEditComment}
							/>
						))}
					</div>
				)}
			</div>
		</div>
	);
}