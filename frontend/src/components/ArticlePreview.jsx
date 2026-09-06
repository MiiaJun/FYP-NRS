import { getTimeAgo } from "../utils/date";
import { useAuth } from "../context/AuthContext";
import { X } from "lucide-react";
import "./ArticlePreview.css";
import "./Article.css";

export default function ArticlePreview({ article, thumbnailPreview, onClose }) {
	const { user } = useAuth();
	const categories = {
		1: "Nintendo",
		2: "PlayStation",
		3: "Xbox",
		4: "PC"
	};
    return (
		<div className="preview-overlay" onClick={onClose}>
			<div className="preview-modal" onClick={(e) => e.stopPropagation()}>
				<button className="preview-close" onClick={onClose}>
					<X size={18} />
				</button>
				<div className="article">
					<article>
						<div className="article-meta">
							In <b>{categories[article.category]}</b> by <b>{user?.username || "Unknown User"}</b>
							<span>•</span>
							{article.updated_at ? `Updated ${getTimeAgo(article.updated_at)}` : getTimeAgo(article.published_at)}
						</div>
						<h1>{article.title}</h1>

						{article.thumbnail && (
							<img
								className="article-thumbnail"
								src={thumbnailPreview}
								alt={article.title}
							/>
						)}

						<div
							className="article-body"
							dangerouslySetInnerHTML={{
								__html: article.content
							}}
						/>
					</article>
				</div>
			</div>
		</div>		
	)
}