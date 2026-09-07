import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api/axios";
import NewsCard from "./NewsCard";

export default function NewsList() {
	const [articles, setArticles] = useState([]);
	const navigate = useNavigate();

    useEffect(() => {
        api.get("/article/listArticle.php")
            .then(response => {
                setArticles(response.data.articles);
            });
    }, []);

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
        </section>
    );
}