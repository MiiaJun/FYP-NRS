import { useEffect, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import ArticleEditor from "../components/ArticleEditor";

export default function EditPublished() {
	const location = useLocation();
    const id = location.state?.articleId;
    const navigate = useNavigate();
    const { isLoggedIn, isLoading } = useAuth();
    const { showNotification } = useNotification();

    const [article, setArticle] = useState(null);

    useEffect(() => {
        if (!isLoading && !isLoggedIn) {
            navigate("/");
        }
		if (!id) {
			navigate("/profile");
		}
    }, [isLoading, isLoggedIn, navigate, id]);

    useEffect(() => {
		if (!id) {
			return;
		}
		
        api.get(`/article/getMyArticle.php?id=${id}`)
            .then(response => {
                setArticle(response.data.article);
            })
            .catch(error => {
                showNotification(error.response?.data?.message || "Failed to load draft", "error");
                navigate("/profile");
            });
    }, [id, navigate, showNotification]);

    const uploadThumbnail = async (thumbnail) => {
        if (!thumbnail) {
            return null;
        }

        if (typeof thumbnail === "string") {
            return thumbnail;
        }

        const data = new FormData();
        data.append("upload", thumbnail);

        const response = await api.post(
            "/article/uploadThumbnail.php",
            data
        );

        return response.data.url;
    };

    const saveArticle = async (formData, status) => {
        try {
            const thumbnailUrl = await uploadThumbnail(formData.thumbnail);

            const response = await api.post("/article/updateArticle.php", {
                article_id: article.article_id,
                title: formData.title,
                content: formData.content,
                thumbnail: thumbnailUrl,
                status: status,
                category_id: formData.category
            });

            showNotification(response.data.message, "success");
        } catch (error) {
            showNotification(error.response?.data?.message || "Failed to save article","error");
        }
    };

    if (!article) {
        return <div>Loading...</div>;
    }

    return (
        <ArticleEditor
            initialData={article}
            onSave={saveArticle}
			isEditing={true}
        />
    );
}