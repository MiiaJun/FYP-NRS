import { useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";
import Loading from "./Loading";
import "./SearchList.css";

export default function SearchList() {
	const [articles, setArticles] = useState([]);
	const navigate = useNavigate();
	const [searchParams] = useSearchParams();
	const [page, setPage] = useState(1);
	const { showNotification } = useNotification();
	const [pagination, setPagination] = useState(null);
	const [isLoading, setIsLoading] = useState(true);
	const search = searchParams.get("search") || "";

	useEffect(() => {
		const controller = new AbortController();
		setIsLoading(true);
		setArticles([]);
		setPagination(null);

		api.get(
			`/article/searchArticle.php?search=${encodeURIComponent(search)}&page=${page}`
		)
		.then(response => {
			setArticles(response.data.articles);
			setPagination(response.data.pagination);
		})
		.catch(error => {
			if (!controller.signal.aborted) {
				showNotification(
					error.response?.data?.message || "Failed to search articles",
					"error"
				);
			}
		})
		.finally(() => {
			if (!controller.signal.aborted) {
				setIsLoading(false);
			}
		});

		return () => controller.abort();
	}, [search, page, showNotification]);

	useEffect(() => {
		setPage(1);
	}, [search]);

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

	return (
		<section className="search-list">
			<h1>Results for "{search}" <span>·</span> {pagination?.total || 0} articles</h1>

			{isLoading ? (
				<Loading />
			) : articles.length === 0 ? (
				<p>No articles found.</p>
			) : (
				articles.map((article) => (
					<NewsCard
						key={article.article_id}
						article={article}
						onClick={() => handleArticleClick(article)}
					/>
				))
			)}

			{pagination && pagination.total_pages > 1 && (
				<Pagination
					page={pagination.page}
					totalPages={pagination.total_pages}
					onPageChange={setPage}
				/>
			)}
		</section>
	);
}