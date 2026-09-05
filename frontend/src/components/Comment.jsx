import { useEffect, useState } from "react";
import { useAuth } from "../context/AuthContext";
import { useModal } from '../context/ModalContext';
import { getTimeAgo } from "../utils/date";
import { ThumbsUp, ThumbsDown } from "lucide-react";
import api from "../api/axios";
import "./Comment.css";

export default function Comment({ comment, repliesByParent, onReply, onEditComment }) {
	const [reaction, setReaction] = useState(comment.user_reaction);
	const [likeCount, setLikeCount] = useState(comment.like_count);
	const [showReply, setShowReply] = useState(false);
	const [replyText, setReplyText] = useState("");
	const { user, isLoggedIn} = useAuth();
	const { openLogin } = useModal();
	const [editing, setEditing] = useState(false);
	const [editText, setEditText] = useState(comment.content);

	const replies = repliesByParent[comment.comment_id] ?? [];

	useEffect(() => {
		setReaction(comment.user_reaction);
		setLikeCount(comment.like_count);
	}, [comment.user_reaction, comment.like_count]);

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

	const handleLike = async () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		const newReaction = reaction === 1 ? null : 1;

		const response = await api.post("/article/setCommentReaction.php", {
			comment_id: comment.comment_id,
			reaction: newReaction
		});

		setReaction(response.data.user_reaction);
		setLikeCount(response.data.like_count);
	};

	const handleDislike = async () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		const newReaction = reaction === 0 ? null : 0;

		const response = await api.post("/article/setCommentReaction.php", {
			comment_id: comment.comment_id,
			reaction: newReaction
		});

		setReaction(response.data.user_reaction);
		setLikeCount(response.data.like_count);
	};

	const handleReply = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setShowReply(true);
	};

	const handleSubmit = async (e) => {
		e.preventDefault();

		if (!replyText.trim()) {
			return;
		}

		const response = await api.post("/article/createComment.php", {
			article_id: comment.article_id,
			parent_comment_id: comment.comment_id,
			content: replyText
		});

		onReply(response.data.comment);

		setReplyText("");
		setShowReply(false);
	};

	const handleSubmitEdit = async (e) => {
		e.preventDefault();

		if (!editText.trim()) {
			return;
		}

		const response = await api.put("/article/editComment.php", {
			comment_id: comment.comment_id,
			content: editText
		});

		onEditComment(response.data.comment);

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
					<b>
						{comment.updated_at
							? `Edited ${getTimeAgo(comment.updated_at)}`
							: getTimeAgo(comment.created_at)}
					</b>
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
						className={reaction === 1 ? "active" : ""}
						onClick={handleLike}
					>
						<ThumbsUp size={18} />
					</button>

					<span>{likeCount}</span>

					<button
						className={reaction === 0 ? "active" : ""}
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