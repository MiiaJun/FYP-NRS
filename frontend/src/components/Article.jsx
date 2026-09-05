import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getTimeAgo } from "../utils/date";
import api from "../api/axios";
import ArticleActions from "./ArticleActions";
import CommentList from "./CommentList";
import "./Article.css";

export default function Article() {
    const { id } = useParams();
    const navigate = useNavigate();

    const [article, setArticle] = useState(null);
	const [errorMessage, setErrorMessage] = useState(null);

	useEffect(() => {
        api.get(`/article/getArticle.php?id=${id}`)
            .then(response => {
                setArticle(response.data.article);
            })
            .catch(error => {
                const errorCode = error.response?.data?.error;

                if (errorCode === "INVALID_ARTICLE_ID") {
                    navigate("/");
                }

				setErrorMessage(error.response?.data?.message);
            });
    }, [id]);

	if (errorMessage) {
    	return <div>{errorMessage}</div>;
	}

	if (!article) {
		return <div>Loading...</div>;
	}

    return (
		<div className="article">
			<article>
				<div className="article-meta">
					In <b>{article.category}</b> by <b>{article.author}</b>
					<span>•</span>
					{article.updated_at ? `Updated ${getTimeAgo(article.updated_at)}` : getTimeAgo(article.published_at)}
				</div>
				<h1>{article.title}</h1>

				{article.thumbnail && (
					<img
						className="article-thumbnail"
						src={article.thumbnail}
						alt={article.title}
					/>
				)}

				<div
					className="article-body"
					dangerouslySetInnerHTML={{
						__html: article.content
					}}
				/>
				<ArticleActions articleId={article.article_id} />
			</article>
			<CommentList articleId={article.article_id} />
		</div>
    );
}