import { useEffect, useRef, useState } from "react";
import { useNotification } from "../context/NotificationContext";
import { CKEditor } from "@ckeditor/ckeditor5-react";
import { ClassicEditor, Essentials, Paragraph, Bold, Italic, Heading, List, Link, BlockQuote, Image, ImageToolbar, ImageUpload, ImageResize, PendingActions  } from "ckeditor5";
import uploadAdapter from "../utils/uploadAdapter";
import "ckeditor5/ckeditor5.css";
import "./CreateArticle.css";

export default function ArticleEditor({ initialData, onSave }) {
	const formRef = useRef(null);
	const [thumbnailPreview, setThumbnailPreview] = useState(null);
	const [isUploading, setIsUploading] = useState(false);
	const { showNotification } = useNotification();

	const [formData, setFormData] = useState({
		title: initialData?.title || "",
		category: initialData?.category_id ? String(initialData.category_id) : "",
		tags: initialData?.tags || "",
		content: initialData?.content || "",
		thumbnail: initialData?.thumbnail || null,
	});

	useEffect(() => {
		return () => {
			if (thumbnailPreview) {
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
	
    const handleSubmit = (e) => {
        e.preventDefault();

		if (!formData.content.trim()) {
			showNotification("Content is required", "error");
			return;
		}

		if (isUploading) {
			showNotification("Please wait for images to finish uploading", "error");
			return;
		}

    	onSave(formData, 1);
    };

	const handleSaveDraft = () => {
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

		onSave(formData, 0);
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
            <h1>Create new article</h1>

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
					<pre>{formData.content}</pre>
                </div>

                <div className="create-article-actions">
                    <div className="secondary-actions">
                        <button type="button" onClick={handleSaveDraft}>Save Draft</button>
                        <button type="button">Preview</button>
                    </div>

                    <button type="submit" className="publish-button">
                        Publish
                    </button>
                </div>
            </form>
        </main>
    );
}