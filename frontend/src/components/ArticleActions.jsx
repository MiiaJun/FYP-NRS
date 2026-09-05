import { useEffect, useState } from "react";
import { useAuth } from "../context/AuthContext";
import { useModal } from '../context/ModalContext';
import { useNotification } from "../context/NotificationContext";
import { ThumbsUp, ThumbsDown, Bookmark, Flag, Share2, Sparkles  } from "lucide-react";
import api from "../api/axios";
import AISummaryModal from "./AISummaryModal";
import "./ArticleActions.css";

export default function ArticleActions({ articleId }) {
	const [reaction, setReaction] = useState(null);
	const [bookmarked, setBookmarked] = useState(false);
	const { isLoggedIn } = useAuth();
	const { openLogin } = useModal();
	const [helpfulCount, setHelpfulCount] = useState(0);
	const [summary, setSummary] = useState(null);
	const [showAISummary, setShowAISummary] = useState(false);
	const { showNotification } = useNotification();
	const [loadingSummary, setLoadingSummary] = useState(false);

	useEffect(() => {
		api.get(`/article/getReaction.php?id=${articleId}`)
			.then(response => {
				setHelpfulCount(response.data.helpful_count);
				setReaction(response.data.user_reaction);
			});

		api.get(`/article/getBookmark.php?id=${articleId}`)
			.then(response => {
				setBookmarked(response.data.bookmarked);
			});
	}, [articleId, isLoggedIn]);

	const handleHelpful = async () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		const newReaction = reaction === 1 ? null : 1;

		const response = await api.post("/article/setReaction.php", {
			article_id: articleId,
			reaction: newReaction
		});

		setReaction(response.data.user_reaction);
		setHelpfulCount(response.data.helpful_count);
	};

	const handleUnhelpful = async () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		const newReaction = reaction === 0 ? null : 0;

		const response = await api.post("/article/setReaction.php", {
			article_id: articleId,
			reaction: newReaction
		});

		setReaction(response.data.user_reaction);
		setHelpfulCount(response.data.helpful_count);
	};

	const handleBookmark = async () => {
		if (!isLoggedIn) {
			openLogin();
			return;
		}

		const response = await api.post("/article/setBookmark.php", {
			article_id: articleId
		});

		setBookmarked(response.data.bookmarked);
	};

	const handleShare = async () => {
		const url = `${window.location.origin}/article/${articleId}`;

		if (navigator.share) {
			await navigator.share({
				title: "Check out this article",
				url: url
			});
		} else {
			await navigator.clipboard.writeText(url);
			alert("Link copied to clipboard");
		}
	}

	const handleAISummary = async () => {
		setShowAISummary(true);
		setLoadingSummary(true);

		try {
			const response = await api.post("/article/aiSummary.php", {
				article_id: articleId
			});

			setSummary(response.data.summary);
		} catch (error) { 
			showNotification( error.response?.data?.message || "Failed to generate summary", "error", ); 
			setShowAISummary(false); 
		} finally {
			setLoadingSummary(false);
		}
	};

    return (
		<>
			<div className="article-actions">
				<button 
					className={reaction === 1 ? "active" : ""}
					onClick={handleHelpful}
				>
					<ThumbsUp size={18} />
					Helpful {helpfulCount}
				</button>

				<button 
					className={reaction === 0 ? "active" : ""}
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

				<button onClick={handleShare}>
					<Share2 size={18} />
					Share
				</button>
				
				<button onClick={handleAISummary}>
					<Sparkles size={18} />
					AI Summary
				</button>
			</div>
			{showAISummary && (
				<AISummaryModal
					summary={summary}
					loading={loadingSummary}
					onClose={() => setShowAISummary(false)}
				/>
			)}
		</>
    );
}