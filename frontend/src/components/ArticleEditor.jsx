import { useEffect, useRef, useState } from "react";
import { useNotification } from "../context/NotificationContext";
import { CKEditor } from "@ckeditor/ckeditor5-react";
import { ClassicEditor, Essentials, Paragraph, Bold, Italic, Heading, List, Link, BlockQuote, Image, ImageToolbar, ImageUpload, ImageResize, PendingActions, MediaEmbed  } from "ckeditor5";
import uploadAdapter from "../utils/uploadAdapter";
import api from "../api/axios";
import ArticlePreview from "./ArticlePreview";
import LoadingOverlay from "./LoadingOverlay";
import "ckeditor5/ckeditor5.css";
import "./CreateArticle.css";

export default function ArticleEditor({ initialData, onSave, isEditing = false, heading }) {
	const formRef = useRef(null);
	const [thumbnailPreview, setThumbnailPreview] = useState(initialData?.thumbnail || null);
	const [isUploading, setIsUploading] = useState(false);
	const { showNotification } = useNotification();
	const [showPreview, setShowPreview] = useState(false);
	const [isLoading, setIsLoading] = useState(false);
	const [allTags, setAllTags] = useState([]);
	const [tagInput, setTagInput] = useState("");
	const [showTagDropdown, setShowTagDropdown] = useState(false);
	const [categories, setCategories] = useState([]);

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
		tags: initialData?.tags || [],
		content: initialData?.content || "",
		thumbnail: initialData?.thumbnail || null,
		published_at: null
	});

	useEffect(() => {
		api.get("/article/listTag.php")
			.then((response) => {
				setAllTags(response.data.tags);
			})
			.catch((error) => {
				showNotification(
					error.response?.data?.message || "Failed to load tags",
					"error"
				);
			});

		api.get("/article/listCategory.php")
			.then((response) => {
				setCategories(response.data.categories);
			})
			.catch((error) => {
				showNotification(
					error.response?.data?.message || "Failed to load categories",
					"error"
				);
			});
	}, [showNotification]);

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

	const addTag = (tag) => {
		setFormData((prev) => {
			if (prev.tags.some((t) => t.tag_id === tag.tag_id)) {
				return prev;
			}

			return {
				...prev,
				tags: [...prev.tags, tag],
			};
		});

		setTagInput("");
		setShowTagDropdown(false);
	};

	const removeTag = (tagId) => {
		setFormData((prev) => ({
			...prev,
			tags: prev.tags.filter((selectedTag) => selectedTag.tag_id !== tagId),
		}));
	};

	const filteredTags = allTags.filter((tag) =>
		tag.name.toLowerCase().includes(tagInput.toLowerCase()) &&
		!formData.tags.some(
			(selectedTag) => selectedTag.tag_id === tag.tag_id
		)
	);

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
            <h1>{heading}</h1>

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
                        {categories.map((category) => (
							<option
								key={category.category_id}
								value={category.category_id}
							>
								{category.category_name}
							</option>
						))}
                    </select>

					<div className="tag-selector">
						<div className="tag-input">
							{formData.tags.map((tag) => (
								<span className="tag-chip" key={tag.tag_id}>
									{tag.name}
									<button
										type="button"
										onClick={() => removeTag(tag.tag_id)}
									>
										×
									</button>
								</span>
							))}

							<input
								id="tags"
								type="text"
								value={tagInput}
								onFocus={() => setShowTagDropdown(true)}
								onBlur={() => setShowTagDropdown(false)}
								onChange={(e) => {
									setTagInput(e.target.value);
									setShowTagDropdown(true);
								}}
								placeholder="Search tags..."
							/>
						</div>

						{showTagDropdown && (
							<div className="tag-options">
								{filteredTags.map((tag) => (
									<button
										type="button"
										key={tag.tag_id}
										onMouseDown={() => addTag(tag)}
									>
										{tag.name}
									</button>
								))}
							</div>
						)}
					</div>
                </div>

                <label className="cover-upload">
                    <input 
						type="file" 
						accept="image/jpeg,image/png,image/webp"
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
							ui: {
								viewportOffset: {
									top: 120
								}
							},
							plugins: [Essentials, Paragraph, Bold, Italic, Heading, List, Link, BlockQuote, Image, ImageUpload, ImageResize, ImageToolbar, PendingActions, MediaEmbed],
							toolbar: [	
								"undo", "redo", "|",
								"heading", "|",
								"bold", "italic", "|",
								"bulletedList", "numberedList", "|",
								"link", "blockQuote", "|",
								"uploadImage", "mediaEmbed"
							],
							image: {
								toolbar: [
									"resizeImage",
								]
							},
							mediaEmbed: {
								previewsInData: true,
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
				<LoadingOverlay />
			)}
        </main>
    );
}