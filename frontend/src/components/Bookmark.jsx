import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import { Bookmark } from "lucide-react";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";
import "./Bookmark.css";

export default function BookmarkList() {
	const navigate = useNavigate();
	const { isLoggedIn, isLoading  } = useAuth();
	const { showNotification } = useNotification();
	const [bookmarkedArticles, setBookmarkedArticles] = useState([]);

	const [bookmarkPage, setBookmarkPage] = useState(1);
	const articlesPerPage = 5;
	const bookmarkTotalPages = Math.max(1, Math.ceil(bookmarkedArticles.length / articlesPerPage));
	const visibleBookmarks = bookmarkedArticles.slice(
		(bookmarkPage - 1) * articlesPerPage,
		bookmarkPage * articlesPerPage
	);

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		if (!isLoggedIn) {
			return;
		}

		api.get("/article/listBookmark.php")
			.then(response => {
				setBookmarkedArticles(
					response.data.articles.map(article => ({
						...article,
						bookmarked: true
					}))
				);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load bookmarks",
					"error"
				);
			});
	}, [isLoggedIn, showNotification]);

	const handleBookmark = async (articleId) => {
		try {
			const response = await api.post("/article/setBookmark.php", {
				article_id: articleId
			});	

			setBookmarkedArticles(prev =>
				prev.map(article =>
					article.article_id === articleId
						? { ...article, bookmarked: response.data.bookmarked }
						: article
				)
			);
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to update bookmark",
				"error"
			);
		}
	};

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

	return (
		<section className="bookmark-page">
			<div className="bookmark-header">
				<h1>Bookmarks</h1>
			</div>

			<div className="bookmarked-articles">
				{visibleBookmarks.map(article => (
					<NewsCard
						key={article.article_id}
						article={article}
						onClick={() => handleArticleClick(article)}
					>
						<button
							className={`bookmark-button ${article.bookmarked ? "bookmark-active" : ""}`}
							onClick={() => handleBookmark(article.article_id)}
						>
							<Bookmark size={18} />
						</button>
					</NewsCard>
				))}
			</div>

			{bookmarkedArticles.length > articlesPerPage && (
				<Pagination
					page={bookmarkPage}
					totalPages={bookmarkTotalPages}
					onPageChange={setBookmarkPage}
				/>
			)}
		</section>
	);
}