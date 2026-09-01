import { useState } from 'react';
import { useAuth } from "../context/AuthContext";
import { ThumbsUp, ThumbsDown, Bookmark, Flag, Share2 } from "lucide-react";
import "./ArticleActions.css";

export default function ArticleActions({ article }) {
	const [reaction, setReaction] = useState(null);
	const [bookmarked, setBookmarked] = useState(false);
	const { isLoggedIn, openLogin } = useAuth();

	const handleHelpful = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setReaction(
			reaction === "helpful" ? null : "helpful"
		);
	};

	const handleUnhelpful = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setReaction(
			reaction === "unhelpful" ? null : "unhelpful"
		);
	};

	const handleBookmark = () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		setBookmarked(!bookmarked);
	};

    return (
			<div className="article-actions">
				<button 
					className={reaction === "helpful" ? "active" : ""}
					onClick={handleHelpful}
				>
					<ThumbsUp size={18} />
					Helpful
				</button>

				<button 
					className={reaction === "unhelpful" ? "active" : ""}
					onClick={handleUnhelpful}
				>
					<ThumbsDown size={18} />
					Unhelpful
				</button>

				<button 
					className={bookmarked ? "bookmark-active" : ""}
					onClick={handleBookmark}
				>
					<Bookmark size={18} />
					Bookmark
				</button>

				<button>
					<Flag size={18} />
					Report
				</button>

				<button>
					<Share2 size={18} />
					Share
				</button>
			</div>
    );
}