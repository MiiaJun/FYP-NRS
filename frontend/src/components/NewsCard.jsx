import { getTimeAgo } from "../utils/date";
import './NewsCard.css'

export default function NewsCard({ article, onClick, children }) {
    return (
        <article className="news-card" onClick={onClick}>
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
					<div className="news-header">
						<div className="news-meta">
							In <b>{article.category}</b> by <b>{article.author}</b>
							<span>•</span>
							{article.status === 0 ? "Draft"
								: article.updated_at ? `Updated ${getTimeAgo(article.updated_at)}`
									: getTimeAgo(article.published_at)
							}
						</div>

						<div className="news-card-buttons" onClick={(e) => e.stopPropagation()}>
							{children}
						</div>
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