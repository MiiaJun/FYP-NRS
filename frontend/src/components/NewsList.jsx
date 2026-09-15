import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";

export default function NewsList() {
	const [articles, setArticles] = useState([]);
	const navigate = useNavigate();
	const [page, setPage] = useState(1);
	const [pagination, setPagination] = useState(null);
	const { showNotification } = useNotification();

    useEffect(() => {
		api.get(`/article/listArticle.php?page=${page}`)
			.then(response => {
				setArticles(response.data.articles);
				setPagination(response.data.pagination);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load articles",
					"error"
				);
			});
	}, [page]);

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

    return (
        <section className="news-list">
            {articles.map((article) => (
                <NewsCard
                    key={article.article_id}
                    article={article}
					onClick={() => handleArticleClick(article)}
                />
            ))}
			{pagination && (
				<Pagination
					page={pagination.page}
					totalPages={pagination.total_pages}
					onPageChange={setPage}
				/>
			)}
        </section>
    );
}