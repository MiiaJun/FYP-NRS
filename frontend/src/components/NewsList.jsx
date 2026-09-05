import { useEffect, useState } from "react";
import api from "../api/axios";
import NewsCard from "./NewsCard";

export default function NewsList() {
	const [articles, setArticles] = useState([]);

    useEffect(() => {
        api.get("/article/listArticle.php")
            .then(response => {
                setArticles(response.data.articles);
            });
    }, []);

    return (
        <section className="news-list">
            {articles.map((article) => (
                <NewsCard
                    key={article.article_id}
                    article={article}
                />
            ))}
        </section>
    );
}