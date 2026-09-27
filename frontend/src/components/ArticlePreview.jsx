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
						<h1>{article.title}</h1>
						<div className="article-meta">
							<div className="article-author">
								<div className="article-author-avatar">
									<img
										className="article-author-picture"
										src={user?.profile_picture || "/default-profile.svg"}
										alt=""
									/>

									<img
										className="article-author-frame"
										src="/frame1.png"
										alt=""
										aria-hidden="true"
									/>
								</div>
								<b>{user?.username || "Unknown User"}</b>
							</div>
							<span>|</span>
							<span>Preview</span>
						</div>

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