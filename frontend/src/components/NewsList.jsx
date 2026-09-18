import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";
import Loading from "./Loading";
import "./NewsList.css"

const categories = [
	{ category_id: 1, category_name: "Nintendo" },
	{ category_id: 2, category_name: "PlayStation" },
	{ category_id: 3, category_name: "Xbox" },
	{ category_id: 4, category_name: "PC" }
];

export default function NewsList() {
	const [articles, setArticles] = useState([]);
	const navigate = useNavigate();
	const [page, setPage] = useState(1);
	const [pagination, setPagination] = useState(null);
	const { showNotification } = useNotification();
	const [activeTab, setActiveTab] = useState("latest");
	const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
		const controller = new AbortController();
		setIsLoading(true);
		setArticles([]);
		setPagination(null);

		api.get(`/article/listArticle.php?page=${page}&tab=${activeTab}`)
			.then(response => {
				setArticles(response.data.articles);
				setPagination(response.data.pagination);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load articles",
					"error"
				);
			})
			.finally(() => {
				if (!controller.signal.aborted) setIsLoading(false);
			});
			
		return () => controller.abort();
	}, [page, activeTab, showNotification]);

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

	const handleTabChange = (tab) => {
		setActiveTab(tab);
		setPage(1);
	};

    return (
        <section className="news-list">
			<div className="category-tabs">
				<button
					className={activeTab === "latest" ? "active" : ""}
					onClick={() => handleTabChange("latest")}
				>
					Latest
				</button>
				{categories.map((category) => (
					<button
						key={category.category_id}
						className={activeTab === category.category_id ? "active" : ""}
						onClick={() => handleTabChange(category.category_id)}
					>
						{category.category_name}
					</button>
				))}
			</div>
            {isLoading ? (
				<Loading />
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