import { useEffect, useMemo, useRef, useState } from "react";
import { useLocation } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useModal } from '../context/ModalContext';
import { useNotification } from "../context/NotificationContext";	
import api from "../api/axios";
import Comment from "./Comment";
import "./CommentList.css";

export default function CommentList({ articleId }) {
	const { hash } = useLocation();
	const { user, isLoggedIn } = useAuth();
	const { openLogin } = useModal();
	const { showNotification } = useNotification();
	const [commentText, setCommentText] = useState("");
	const commentInputRef = useRef(null);
	const [comments, setComments] = useState([]);

	useEffect(() => {
		api.get(`/article/listComment.php?id=${articleId}`)
		.then((response) => {
			setComments(response.data.comments);
		})
		.catch((error) => {
			showNotification(
				error.response?.data?.message || "Failed to load comments",
				"error"
			);
		});
	}, [articleId, user?.user_id]);

	useEffect(() => {
		if (!hash.startsWith("#comment-")) {
			return;
		}

		const target = document.getElementById(hash.slice(1));

		if (target) {
			target.scrollIntoView({
				behavior: "smooth",
				block: "center"
			});
		}
	}, [comments, hash]);

	const handleCommentChange = (e) => {
		setCommentText(e.target.value);

		e.target.style.height = "24px";
		e.target.style.height = `${e.target.scrollHeight}px`;
	};

	const repliesByParent = useMemo(() => {
		const map = {};

		for (const comment of comments) {
			const key = comment.parent_comment_id ?? "root";

			if (!map[key]) {
				map[key] = [];
			}

			map[key].push(comment);
		}

		for (const key in map) {
			map[key].sort(
				(a, b) => {
					if (key === "root") {
						return new Date(b.created_at) - new Date(a.created_at);
					}

					return new Date(a.created_at) - new Date(b.created_at);
				}
			);
		}

		return map;
	}, [comments]);

	const parentComments = repliesByParent["root"] ?? [];

	const handleSubmit = async (e) => {
		e.preventDefault();

		if (!isLoggedIn) {
			openLogin();
			return;
		}

		if (!commentText.trim()) {
			return;
		}

		try {
			const response = await api.post("/article/createComment.php", {
				article_id: articleId,
				content: commentText
			});

			void api.post("/user/createCommentNotification.php", {
				comment_id: response.data.comment.comment_id
			}).catch(() => {});

			setComments(prev => [response.data.comment, ...prev]);
			setCommentText("");

			commentInputRef.current.style.height = "24px";
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to post comment",
				"error"
			);
		}
	};

	const handleReply = (newReply) => {
		setComments(prev => [...prev, newReply]);
	};

	const handleEditComment = (updatedComment) => {
		setComments(prev =>
			prev.map(comment =>
				comment.comment_id === updatedComment.comment_id
					? updatedComment
					: comment
			)
		);
	};

	const handleDeleteComment = (commentId) => {
		setComments(prev =>
			prev.map(comment =>
				comment.comment_id === commentId
					? {
						...comment,
						status: 3,
						content: "This comment was deleted by the author.",
						username: "[deleted]",
						user_id: null,
						profile_picture: null,
						profile_frame_url: null
					}
					: comment
			)
		);
	};

	return (
		<section className="comment-list">
			<h2>Comments</h2>

			<form className="comment-form" onSubmit={handleSubmit}>
				<textarea
					ref={commentInputRef}
					value={commentText}
					maxLength={2000}
					onChange={handleCommentChange}
					placeholder={
						isLoggedIn
							? "Write a comment..."
							: "Log in to comment..."
					}
				/>

				<button type="submit">
					Comment
				</button>
			</form>

			<div className="comment-items">
				{parentComments.map(comment => (
					<Comment
						key={comment.comment_id}
						comment={comment}
						repliesByParent={repliesByParent}
						onReply={handleReply}
						onEditComment={handleEditComment}
						onDeleteComment={handleDeleteComment}
					/>
				))}
			</div>
		</section>
	);
}