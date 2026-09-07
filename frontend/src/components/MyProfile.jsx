import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import "./MyProfile.css";

export default function MyProfile() {
	const navigate = useNavigate();
	const { isLoggedIn, isLoading } = useAuth();
	const { showNotification } = useNotification();
    const [activeTab, setActiveTab] = useState("published");
	const [publishedArticles, setPublishedArticles] = useState([]);
	const [drafts, setDrafts] = useState([]);

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		api.get("/article/listMyArticle.php")
			.then(response => {
				setPublishedArticles(response.data.published);
				setDrafts(response.data.drafts);
			})
			.catch(error => {
				showNotification(error.response?.data?.message || "Failed to load articles", "error");
			});
	}, []);

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

	const handleEdit = (articleId, url) => {
		navigate(url, {
			state: { articleId }
		});
	};

    return (
        <section className="my-profile">
            <div className="profile-tabs">
                <button
                    className={activeTab === "published" ? "active" : ""}
                    onClick={() => setActiveTab("published")}
                >
                    Published
                </button>

                <button
                    className={activeTab === "drafts" ? "active" : ""}
                    onClick={() => setActiveTab("drafts")}
                >
                    Drafts
                </button>
            </div>

            {activeTab === "published" && (
                <div className="published-articles">
                    {publishedArticles.map(article => (
                        <NewsCard
                            key={article.article_id}
                            article={article}
                            onClick={() => handleArticleClick(article)}
                        >
							<button 
								className="edit-button" 
								onClick={() => handleEdit(article.article_id, "/edit-published")}
							>
								Edit
							</button>
							<button className="delete-button">Delete</button>
						</NewsCard>
                    ))}
                </div>
            )}

            {activeTab === "drafts" && (
                <div className="draft-articles">
                    {drafts.map(article => (
                        <NewsCard 
							key={article.article_id} 
							article={article}
						>
                            <button 
								className="edit-button" 
								onClick={() => handleEdit(article.article_id, "/edit-draft")}
							>
								Edit
							</button>
                            <button className="delete-button">Delete</button>
                        </NewsCard>
                    ))}
                </div>
            )}
        </section>
    );
}