import { useEffect, useState } from "react";
import "./AdminActionModal.css";

export default function CosmeticModal({ isEditing = false, cosmetic = null, onConfirm, onClose }) {
	const [isSubmitting, setIsSubmitting] = useState(false);
	const [formData, setFormData] = useState({
		name: cosmetic?.name || "",
		cosmetic_type_id: cosmetic?.cosmetic_type_id || "1",
		price: cosmetic?.price ?? "",
		image: cosmetic?.image_url || null
	});
	const [imagePreview, setImagePreview] = useState(cosmetic?.image_url || null);

	useEffect(() => {
		return () => {
			if (imagePreview?.startsWith("blob:")) {
				URL.revokeObjectURL(imagePreview);
			}
		};
	}, [imagePreview]);

	const handleChange = (e) => {
		setFormData(prev => ({
			...prev,
			[e.target.id]: e.target.value
		}));
	};

	const handleImageChange = (e) => {
		const file = e.target.files[0];

		if (file) {
			setFormData(prev => ({
				...prev,
				image: file
			}));

			setImagePreview(URL.createObjectURL(file));
		}
	};

	const handleSubmit = async (e) => {
		e.preventDefault();

		if (!formData.name.trim() || !formData.image || isSubmitting) {
			return;
		}

		setIsSubmitting(true);

		try {
			const success = await onConfirm(formData);

			if (success) {
				onClose();
			}
		} finally {
			setIsSubmitting(false);
		}
	};

	return (
		<div
			className="admin-action-overlay"
			onClick={() => {
				if (!isSubmitting) {
					onClose();
				}
			}}
		>
			<div
				className="admin-action-modal"
				onClick={e => e.stopPropagation()}
			>
				<h2>{isEditing ? "Edit" : "Add"} Cosmetic</h2>

				<form onSubmit={handleSubmit}>
					<div className="form-group">
						<label htmlFor="name">Name</label>
						<input
							id="name"
							className="action-name"
							type="text"
							value={formData.name}
							onChange={handleChange}
							maxLength={30}
							required
						/>
					</div>

					<div className="form-group">
						<label htmlFor="cosmetic_type_id">Type</label>
						<select
							id="cosmetic_type_id"
							className="action-name"
							value={formData.cosmetic_type_id}
							onChange={handleChange}
							disabled={isEditing}
						>
							<option value="1">Profile frame</option>
							<option value="2">Background</option>
						</select>
					</div>

					<div className="form-group">
						<label htmlFor="price">Price</label>
						<input
							id="price"
							className="action-name"
							type="number"
							value={formData.price}
							onChange={handleChange}
							min="0"
							step="1"
							required
						/>
					</div>

					<div className="form-group">
						<label htmlFor="image">Image</label>
						{imagePreview && (
							<img
								className="cosmetic-preview"
								src={imagePreview}
								alt="Cosmetic preview"
							/>
						)}
						<input
							id="image"
							type="file"
							accept="image/jpeg,image/png,image/webp"
							onChange={handleImageChange}
							required={!isEditing}
						/>
					</div>

					<div className="action-buttons">
						<button
							type="button"
							className="action-cancel"
							onClick={onClose}
							disabled={isSubmitting}
						>
							Cancel
						</button>

						<button
							type="submit"
							className="action-save"
							disabled={isSubmitting || !formData.name.trim() || !formData.image}
						>
							{isSubmitting ? "Saving..." : isEditing ? "Save" : "Add"}
						</button>
					</div>
				</form>
			</div>
		</div>
	);
}