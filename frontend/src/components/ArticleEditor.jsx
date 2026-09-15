import { useEffect, useRef, useState } from "react";
import { useNotification } from "../context/NotificationContext";
import { CKEditor } from "@ckeditor/ckeditor5-react";
import { ClassicEditor, Essentials, Paragraph, Bold, Italic, Heading, List, Link, BlockQuote, Image, ImageToolbar, ImageUpload, ImageResize, PendingActions  } from "ckeditor5";
import uploadAdapter from "../utils/uploadAdapter";
import ArticlePreview from "./ArticlePreview";
import "ckeditor5/ckeditor5.css";
import "./CreateArticle.css";

export default function ArticleEditor({ initialData, onSave, isEditing = false }) {
	const formRef = useRef(null);
	const [thumbnailPreview, setThumbnailPreview] = useState(initialData?.thumbnail || null);
	const [isUploading, setIsUploading] = useState(false);
	const { showNotification } = useNotification();
	const [showPreview, setShowPreview] = useState(false);
	const [isLoading, setIsLoading] = useState(false);

	const [publishMode, setPublishMode] = useState("now");
	const [scheduledDate, setScheduledDate] = useState("");
	const [scheduledTime, setScheduledTime] = useState("");
	const today = new Date();
	const getLocalDateString = (date) => {
		const year = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");

		return `${year}-${month}-${day}`;
	};
	const getLocalTimeString = (date) => {
		const hours = String(date.getHours()).padStart(2, "0");
		const minutes = String(date.getMinutes()).padStart(2, "0");

		return `${hours}:${minutes}`;
	};
	const getMinTime = () => {
		if (scheduledDate !== getLocalDateString(today)) {
			return undefined;
		}

		return getLocalTimeString(today);
	};

	const [formData, setFormData] = useState({
		title: initialData?.title || "",
		summary: initialData?.summary || "",
		category: initialData?.category_id ? String(initialData.category_id) : "",
		tags: initialData?.tags || "",
		content: initialData?.content || "",
		thumbnail: initialData?.thumbnail || null,
		published_at: null
	});

	useEffect(() => {
		return () => {
			if (thumbnailPreview?.startsWith("blob:")) {
				URL.revokeObjectURL(thumbnailPreview);
			}
		};
	}, [thumbnailPreview]);

	const handleChange = (e) => {
		setFormData((prev) => ({
			...prev,
			[e.target.id]: e.target.value,
		}));
	};
	
    const handleSubmit = async (e) => {
        e.preventDefault();

		if (!formData.content.trim()) {
			showNotification("Content is required", "error");
			return;
		}

		if (isUploading) {
			showNotification("Please wait for images to finish uploading", "error");
			return;
		}

		let publishedAt;
		if (publishMode === "schedule") {
			if (!scheduledDate || !scheduledTime) {
				showNotification("Please choose a date and time", "error");
				return;
			}

			const scheduledDateTime = new Date(
				`${scheduledDate}T${scheduledTime}:00`
			);

			if (scheduledDateTime <= new Date()) {
				showNotification("Scheduled time must be in the future", "error");
				return;
			}

			publishedAt = scheduledDateTime.toISOString();
		}

		setIsLoading(true);

    	try {
			await onSave({ ...formData, published_at: publishedAt }, 1);
		} finally {
			setIsLoading(false);
		}
    };

	const handleSaveDraft = async () => {
		if (!formRef.current.reportValidity()) {
			return;
		}

		if (!formData.content.trim()) {
			showNotification("Content is required", "error");
			return;
		}

		if (isUploading) {
			showNotification("Please wait for images to finish uploading", "error");
			return;
		}

		setIsLoading(true);

		try {
			await onSave(formData, 0);
		} finally {
			setIsLoading(false);
		}
	};

	const handlePreview = () => {
		if (!formRef.current.reportValidity()) {
			return;
		}

		if (!formData.content.trim()) {
			showNotification("Content is required", "error");
			return;
		}

		if (isUploading) {
			showNotification("Please wait for images to finish uploading", "error");
			return;
		}

		setShowPreview(true);
	};

	const handleCoverChange = (e) => {
        const file = e.target.files[0];

        if (file) {
			if (thumbnailPreview) {
				URL.revokeObjectURL(thumbnailPreview);
			}
			setFormData((prev) => ({
				...prev,
				thumbnail: file,
			}));

			setThumbnailPreview(URL.createObjectURL(file));
		}
    };

    return (
        <main className="create-article">
            <h1>{isEditing ? "Edit article" : "Create new article"}</h1>

            <form ref={formRef} onSubmit={handleSubmit}>
                <div className="form-group">
                    <label htmlFor="title">Title</label>
                    <input
                        id="title"
                        type="text"
						value={formData.title}
						onChange={handleChange}
                        placeholder="Give your article a headline..."
						required
                    />
                </div>

				<div className="form-group">
					<label htmlFor="summary">Summary</label>
					<textarea
						id="summary"
						value={formData.summary}
						onChange={handleChange}
						placeholder="Write a short summary of your article..."
						rows="4"
					/>
				</div>

                <div className="article-meta">
                    <select 
						id="category"
						value={formData.category}
						onChange={handleChange}
						required
					>
                        <option value="" disabled>
                            Category
                        </option>
                        <option value="1">Nintendo</option>
						<option value="2">PlayStation</option>
						<option value="3">Xbox</option>
						<option value="4">PC</option>
                    </select>

                    <input
						id="tags"
                        type="text"
						value={formData.tags}
						onChange={handleChange}
                        placeholder="Add entity tags (e.g. Elden Ring, FromSoftware)"
                    />
                </div>

                <label className="cover-upload">
                    <input 
						type="file" 
						accept="image/*" 
						hidden 
						onChange={handleCoverChange}
					/>
					
                    {thumbnailPreview ? (
						<img
							src={thumbnailPreview}
							alt="Cover preview"
						/>
					) : (
						<span>+ Upload cover image</span>
					)}
                </label>

                <div className="form-group">
                    <label>Body</label>
                    <CKEditor
						editor={ClassicEditor}
						config={{
							licenseKey: "GPL",
							plugins: [Essentials, Paragraph, Bold, Italic, Heading, List, Link, BlockQuote, Image, ImageUpload, ImageResize, ImageToolbar, PendingActions],
							toolbar: [	
								"undo", "redo", "|",
								"heading", "|",
								"bold", "italic", "|",
								"bulletedList", "numberedList", "|",
								"link", "blockQuote", "|",
								"uploadImage"
							],
							image: {
								toolbar: [
									"resizeImage",
								]
							},
							placeholder: "Write your story...",
						}}
						data={formData.content}
						onReady={(editor) => {
							editor.plugins.get("FileRepository").createUploadAdapter = uploadAdapter;

							const pendingActions = editor.plugins.get("PendingActions");

							pendingActions.on("change:hasAny", (event, propertyName, newValue) => {
								setIsUploading(newValue);
							});
						}}
						onChange={(event, editor) => {
							const data = editor.getData();
							setFormData((prev) => ({
								...prev,
								content: data,
							}));
						}}
					/>
                </div>

				{!isEditing && (
					<div className="publish-settings">
						<h3>Publish settings</h3>
						<label>
							<input
								type="radio"
								name="publishMode"
								checked={publishMode === "now"}
								onChange={() => setPublishMode("now")}
							/>
							Publish now
						</label>
						<label>
							<input
								type="radio"
								name="publishMode"
								checked={publishMode === "schedule"}
								onChange={() => setPublishMode("schedule")}
							/>
							Schedule for later
						</label>
						{publishMode === "schedule" && (
							<div className="schedule-inputs">
								<input
									type="date"
									value={scheduledDate}
									onChange={(e) => setScheduledDate(e.target.value)}
									min={getLocalDateString(today)}
									required
								/>

								<input
									type="time"
									value={scheduledTime}
									onChange={(e) => setScheduledTime(e.target.value)}
									min={getMinTime()}
									required
								/>
							</div>
						)}
					</div>
				)}

                <div className="create-article-actions">
                    <div className="secondary-actions">
                         {!isEditing && (
							<button type="button" onClick={handleSaveDraft}>
								Save Draft
							</button>
						)}
                        <button type="button" onClick={handlePreview}>Preview</button>
                    </div>

                    <button type="submit" className="publish-button">
                        {isEditing ? "Save Changes" : "Publish"}
                    </button>
                </div>
            </form>
			{showPreview && (
				<ArticlePreview
					article={{
						...formData,
						published_at: new Date().toISOString(),
						updated_at: null
					}}
					thumbnailPreview={thumbnailPreview}
					onClose={() => setShowPreview(false)}
				/>
			)}

			{isLoading && (
				<div className="loading-overlay">
					<div className="loading-modal">
						<div className="loading-spinner"></div>
						<p>Loading...</p>
					</div>
				</div>
			)}
        </main>
    );
}