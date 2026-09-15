import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import NewsCard from "./NewsCard";
import Pagination from "./Pagination";
import "./MyProfile.css";

export default function MyProfile() {
	const navigate = useNavigate();
	const { user, isLoggedIn, isLoading } = useAuth();
	const { showNotification } = useNotification();
    const [activeTab, setActiveTab] = useState("published");
	const [profileUser, setProfileUser] = useState(null);
	const [publishedArticles, setPublishedArticles] = useState([]);
	const [drafts, setDrafts] = useState([]);

	const [publishedPage, setPublishedPage] = useState(1);
	const articlesPerPage = 5;
	const publishedTotalPages = Math.max(1, Math.ceil(publishedArticles.length / articlesPerPage));
	const visiblePublished = publishedArticles.slice(
		(publishedPage - 1) * articlesPerPage,
		publishedPage * articlesPerPage
	);

	const trustScore = 80;
	const trustScoreClass =
		trustScore >= 80 ? "high"
		: trustScore >= 50 ? "medium"
		: "low";

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoading, isLoggedIn, navigate]);

	useEffect(() => {
		if (!user) {
			return;
		}

		api.get(`/user/getUser.php?id=${user.user_id}`)
			.then(response => {
				setProfileUser(response.data.user);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load profile",
					"error"
				);
			});
	}, [user]);

	useEffect(() => {
		api.get("/article/listMyArticle.php")
			.then(response => {
				setPublishedArticles(response.data.published);
				setDrafts(response.data.drafts);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load articles", 
					"error"
				);
			});
	}, []);

	useEffect(() => {
		if (publishedPage > publishedTotalPages) {
			setPublishedPage(publishedTotalPages);
		}
	}, [publishedTotalPages, publishedPage]);

	const handleArticleClick = (article) => {
		navigate(`/article/${article.article_id}`);
	};

	const handleEdit = (articleId, url) => {
		navigate(url, {
			state: { articleId }
		});
	};

	if (isLoading || !user || !profileUser) {
		return <div>Loading...</div>;
	}

    return (
        <section className="my-profile">
			<div className="profile-header">
				<div className="profile-main">
					<img
						className="profile-picture"
						src={profileUser.profile_picture || "/default-profile.svg"}
						alt={profileUser.username}
					/>
					<div className="profile-info">
						<div className="profile-name-row">
							<div>
								<h1>{profileUser.username}</h1>
								<div className={`trust-score ${trustScoreClass}`}>
									Trust Score: {trustScore}
								</div>
							</div>
							<button
								className="edit-profile-button"
								onClick={() => navigate("/edit-profile")}
							>
								Edit profile
							</button>
						</div>
						<p className="profile-bio">
							Covering PC hardware, indie games and retro re-releases since 2019.
						</p>
					</div>
				</div>
				<div className="profile-stats">
					<div className="profile-stat">
						<strong>{publishedArticles.length}</strong>
						<span>Published</span>
					</div>
					<div className="profile-stat">
						<strong>{profileUser.followers_count}</strong>
						<span>Followers</span>
					</div>
					<div className="profile-stat">
						<strong>{profileUser.following_count}</strong>
						<span>Following</span>
					</div>
				</div>
			</div>

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
				<>
					<div className="published-articles">
						{visiblePublished.map(article => (
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
					{publishedArticles.length > articlesPerPage && (
                        <Pagination
                            page={publishedPage}
                            totalPages={publishedTotalPages}
                            onPageChange={setPublishedPage}
                        />
                    )}
				</>
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