import { useNavigate } from "react-router-dom";
import './NewsCard.css'

export default function NewsCard({ article }) {
	const navigate = useNavigate();
    return (
        <article className="news-card" onClick={() => navigate(`/article/${article.id}`)}>
            <div className="news-thumbnail">
                {article.trending && (
                    <span className="trending-badge">
                        TRENDING
                    </span>
                )}

                {article.image && (
                    <img src={article.image} alt={article.title} />
                )}
            </div>

            <div className="news-content">
				<div>
					<div className="news-meta">
						In <b>{article.category}</b> by <b>{article.author}</b> {article.date}
					</div>
					<h2>{article.title}</h2>
					<p>{article.description}</p>
				</div>
				<div className="news-actions" onClick={(e) => e.stopPropagation()}>
					{/* icons */}
				</div>
            </div>
        </article>
    );
}