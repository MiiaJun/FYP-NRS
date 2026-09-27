import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";
import Loading from "./Loading";
import "./NewsList.css"

export default function NewsList() {
	const [articles, setArticles] = useState([]);
	const navigate = useNavigate();
	const [page, setPage] = useState(1);
	const [pagination, setPagination] = useState(null);
	const { showNotification } = useNotification();
	const [activeTab, setActiveTab] = useState("latest");
	const [isLoading, setIsLoading] = useState(true);
	const [categories, setCategories] = useState([]);
	const visibleCategories = categories.slice(0, 4);
	const moreCategories = categories.slice(4);
	const [showMoreCategories, setShowMoreCategories] = useState(false);

	useEffect(() => {
		api.get("/article/listCategory.php")
			.then((response) => {
				setCategories(response.data.categories);
			});
	}, []);

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
				{visibleCategories.map((category) => (
					<button
						key={category.category_id}
						className={activeTab === category.category_id ? "active" : ""}
						onClick={() => handleTabChange(category.category_id)}
					>
						{category.category_name}
					</button>
				))}
				{moreCategories.length > 0 && (
					<div className="more-category-menu">
						<button
							className={
								moreCategories.some(
									(category) => category.category_id === activeTab
								)
									? "active"
									: ""
							}
							onClick={() => setShowMoreCategories(!showMoreCategories)}
						>
							More
						</button>

						{showMoreCategories && (
							<div className="more-category-options">
								{moreCategories.map((category) => (
									<button
										key={category.category_id}
										onClick={() => {
											handleTabChange(category.category_id);
											setShowMoreCategories(false);
										}}
									>
										{category.category_name}
									</button>
								))}
							</div>
						)}
					</div>
				)}
			</div>
			<div className="news-list-content">
				{isLoading ? (
					<Loading />
				) : (
					<>
						{articles.map((article) => (
							<NewsCard
								key={article.article_id}
								article={article}
								onClick={() => handleArticleClick(article)}
							/>
						))}
						{pagination && pagination.total_pages > 1 && (
							<Pagination
								page={pagination.page}
								totalPages={pagination.total_pages}
								onPageChange={setPage}
							/>
						)}
					</>
				)}
			</div>
        </section>
    );
}