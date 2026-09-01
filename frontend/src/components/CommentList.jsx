import { useMemo, useRef, useState } from "react";
import { useAuth } from "../context/AuthContext";
import Comment from "./Comment";
import "./CommentList.css";

export default function CommentList({ articleId }) {
	const { user, isLoggedIn, openLogin } = useAuth();
	const [commentText, setCommentText] = useState("");
	const commentInputRef = useRef(null);

	const handleCommentChange = (e) => {
		setCommentText(e.target.value);

		e.target.style.height = "24px";
		e.target.style.height = `${e.target.scrollHeight}px`;
	};

	const [comments, setComments] = useState([
		{
			comment_id: 1,
			user_id: 1,
			username: "John",
			profile_picture: null,
			content: "This looks really interesting!",
			created_at: "31 August 2026",
			parent_comment_id: null,
			like_count: 12,
			dislike_count: 1
		},
		{
			comment_id: 2,
			user_id: 2,
			username: "Sarah",
			profile_picture: null,
			content: "I agree! Really looking forward to it.",
			created_at: "31 August 2026",
			parent_comment_id: 1,
			like_count: 5,
			dislike_count: 0
		},
		{
			comment_id: 4,
			user_id: 4,
			username: "Alex",
			profile_picture: null,
			content: "Same here! I can't wait to see more.",
			created_at: "31 August 2026",
			parent_comment_id: 1,
			like_count: 8,
			dislike_count: 1
		},
		{
			comment_id: 3,
			user_id: 3,
			username: "Mike",
			profile_picture: null,
			content: "Hopefully we get more information soon.",
			created_at: "31 August 2026",
			parent_comment_id: null,
			like_count: 3,
			dislike_count: 2
		}
	]);

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
				(a, b) =>
					new Date(a.created_at) - new Date(b.created_at)
			);
		}

		return map;
	}, [comments]);

	const parentComments = repliesByParent["root"] ?? [];

	const handleSubmit = (e) => {
		e.preventDefault();

		if (!isLoggedIn) {
			openLogin();
			return;
		}

		if (!commentText.trim()) {
			return;
		}

		// POST to PHP later
		const newComment = {
			comment_id: comments.length + 1,
			user_id: user.user_id,
			username: user.username,
			profile_picture: user.profile_picture,
			content: commentText,
			created_at: "1 September 2026",
			parent_comment_id: null,
			like_count: 0,
			dislike_count: 0
		};

		setComments(prev => [newComment, ...prev]);
		setCommentText("");

		commentInputRef.current.style.height = "24px";
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

	return (
		<section className="comment-list">
			<h2>Comments</h2>

			<form className="comment-form" onSubmit={handleSubmit}>
				<textarea
					ref={commentInputRef}
					value={commentText}
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
					/>
				))}
			</div>
		</section>
	);
}