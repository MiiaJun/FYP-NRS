import { useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { useNotification } from "../context/NotificationContext";
import { ListSortDescending } from "lucide-react";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";
import Loading from "./Loading";
import "./SearchList.css";

const sortOptions = [
	{ value: "latest", label: "Latest" },
	{ value: "trending", label: "Trending" },
	{ value: "helpful", label: "Most helpful" }
];

export default function SearchList() {
	const [articles, setArticles] = useState([]);
	const navigate = useNavigate();
	const [searchParams] = useSearchParams();
	const [page, setPage] = useState(1);
	const { showNotification } = useNotification();
	const [pagination, setPagination] = useState(null);
	const [isLoading, setIsLoading] = useState(true);
	const search = searchParams.get("search") || "";
	const tagId = searchParams.get("tag_id") || "";
	const [tagName, setTagName] = useState("");
	const [categories, setCategories] = useState([]);
	const [categoryId, setCategoryId] = useState("");
	const [sortBy, setSortBy] = useState("latest");

	useEffect(() => {
		api.get("/article/listCategory.php")
			.then(response => {
				setCategories(response.data.categories);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load categories",
					"error"
				);
			});
	}, [showNotification]);

	useEffect(() => {
		const controller = new AbortController();
		setIsLoading(true);
		setArticles([]);
		setPagination(null);

		const categoryQuery = categoryId ? `&category_id=${categoryId}` : "";

		const url = tagId
			? `/article/searchArticle.php?tag_id=${encodeURIComponent(tagId)}&page=${page}&sort=${sortBy}${categoryQuery}`
			: `/article/searchArticle.php?search=${encodeURIComponent(search)}&page=${page}&sort=${sortBy}${categoryQuery}`;

		api.get(url, { signal: controller.signal })
			.then(response => {
				setArticles(response.data.articles);
				setPagination(response.data.pagination);
				setTagName(response.data.tag_name || "");
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
	}, [search, tagId, page, categoryId, sortBy, showNotification]);

	useEffect(() => {
		setPage(1);
		setCategoryId("");
		setSortBy("latest");
	}, [search, tagId]);

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

	const handleCategoryChange = (e) => {
		setCategoryId(e.target.value);
		setPage(1);
	};

	const handleSortToggle = () => {
		setSortBy(prev => {
			const index = sortOptions.findIndex(option => option.value === prev);
			return sortOptions[(index + 1) % sortOptions.length].value;
		});

		setPage(1);
	};

	return (
		<section className="search-list">
			{tagId ? (
					<h1>Results for #{tagName} <span>·</span> {pagination?.total || 0} articles</h1>
			) : (
					<h1>Results for "{search}" <span>·</span> {pagination?.total || 0} articles</h1>
			)}

			<div className="search-sort-row">
				<select
					className="search-category"
					value={categoryId}
					onChange={handleCategoryChange}
				>
					<option value="">All categories</option>
					{categories.map(category => (
						<option 
							key={category.category_id} 
							value={category.category_id}
						>
							{category.category_name}
						</option>
					))}
				</select>

				<button
					className="search-sort-button"
					onClick={handleSortToggle}
				>
					<ListSortDescending size={18} />
					<span>
						Sort by: {sortOptions.find(option => option.value === sortBy).label}
					</span>
				</button>
			</div>

			<div className="search-list-content">
				{isLoading ? (
					<Loading />
				) : articles.length === 0 ? (
					<p className="search-empty">No articles found.</p>
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
			</div>
		</section>
	);
}