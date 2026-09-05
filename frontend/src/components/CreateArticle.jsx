import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { useNotification } from "../context/NotificationContext";
import api from "../api/axios";
import ArticleEditor from "../components/ArticleEditor";

export default function CreateArticle() {
	const navigate = useNavigate();
	const { isLoggedIn, isLoading } = useAuth();
	const { showNotification } = useNotification();

	useEffect(() => {
		if (!isLoading && !isLoggedIn) {
			navigate("/");
		}
	}, [isLoggedIn, navigate]);

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

			const response = await api.post("/article/createArticle.php", {
				title: formData.title,
				content: formData.content,
				thumbnail: thumbnailUrl,
				status: status,
				category_id: formData.category
			});

			showNotification(response.data.message, "success");
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to save article",
				"error"
			);
		}
	};

    return (
        <ArticleEditor onSave={saveArticle} />
    );
}