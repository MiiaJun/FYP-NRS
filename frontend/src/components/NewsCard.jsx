import { useNavigate } from "react-router-dom";
import { getTimeAgo } from "../utils/date";
import './NewsCard.css'

export default function NewsCard({ article }) {
	const navigate = useNavigate();
    return (
        <article className="news-card" onClick={() => navigate(`/article/${article.article_id}`)}>
            <div className="news-thumbnail">
                {article.trending && (
                    <span className="trending-badge">
                        TRENDING
                    </span>
                )}

                {article.thumbnail && (
                    <img src={article.thumbnail} alt={article.title} />
                )}
            </div>

            <div className="news-content">
				<div>
					<div className="news-meta">
						In <b>{article.category}</b> by <b>{article.author}</b>
						<span>•</span>
						{article.updated_at ? `Updated ${getTimeAgo(article.updated_at)}` : getTimeAgo(article.published_at)}
					</div>
					<h2>{article.title}</h2>
					<p>{article.summary}</p>
				</div>
				<div className="news-actions" onClick={(e) => e.stopPropagation()}>
					{/* icons */}
				</div>
            </div>
        </article>
    );
}