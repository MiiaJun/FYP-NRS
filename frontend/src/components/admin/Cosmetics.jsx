import { useEffect, useState } from "react";
import { useAuth } from "../../context/AuthContext";
import { useNotification } from "../../context/NotificationContext";
import { Coins, Plus } from "lucide-react";
import api from "../../api/axios";
import Loading from "../Loading";
import CosmeticModal from "./CosmeticModal";
import "./Cosmetics.css";

const types = [
	{ cosmetic_type_id: 1, code: "Profile frames" },
	{ cosmetic_type_id: 2, code: "Backgrounds" }
];

export default function Cosmetics() {
	const { user } = useAuth();
	const { showNotification } = useNotification();
	const [cosmetics, setCosmetics] = useState([]);
	const [selectedType, setSelectedType] = useState(1);
	const [selectedCosmetic, setSelectedCosmetic] = useState(null);
	const [editingCosmetic, setEditingCosmetic] = useState(null);
	const [showAddModal, setShowAddModal] = useState(false);
	const [isCosmeticsLoading, setIsCosmeticsLoading] = useState(true);
	const [isLoading, setIsLoading] = useState(false);
	const [refreshCount, setRefreshCount] = useState(0);

	const filteredCosmetics = cosmetics.filter(
		cosmetic => cosmetic.cosmetic_type_id == selectedType
	);

	useEffect(() => {
		api.get("/user/listShopCosmetic.php")
			.then(response => {
				setCosmetics(response.data.cosmetics);
				setSelectedCosmetic(null);
			})
			.catch(error => {
				showNotification(
					error.response?.data?.message || "Failed to load cosmetics",
					"error"
				);
			})
			.finally(() => {
				setIsCosmeticsLoading(false);
			});
	}, [showNotification, refreshCount]);

	const handleTypeChange = (typeId) => {
		setSelectedType(typeId);
		setSelectedCosmetic(null);
	};

	const uploadCosmetic = async (image) => {
		if (typeof image === "string") {
			return image;
		}

		const data = new FormData();
		data.append("upload", image);

		const response = await api.post("/admin/uploadCosmetic.php", data);

		return response.data.url;
	};

	const handleAddCosmetic = async (formData) => {
		try {
			const imageUrl = await uploadCosmetic(formData.image);

			const response = await api.post("/admin/addCosmetic.php", {
				name: formData.name,
				cosmetic_type_id: formData.cosmetic_type_id,
				price: formData.price,
				image_url: imageUrl
			});

			showNotification(response.data.message, "success");
			setRefreshCount(prev => prev + 1);
			return true;
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to add cosmetic",
				"error"
			);
			return false;
		}
	};

	const handleEditCosmetic = async (formData) => {
		try {
			const imageUrl = await uploadCosmetic(formData.image);

			const response = await api.post("/admin/editCosmetic.php", {
				cosmetic_id: editingCosmetic.cosmetic_id,
				name: formData.name,
				cosmetic_type_id: formData.cosmetic_type_id,
				price: formData.price,
				image_url: imageUrl
			});

			showNotification(response.data.message, "success");
			setRefreshCount(prev => prev + 1);
			return true;
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to update cosmetic",
				"error"
			);
			return false;
		}
	};

	const handleDeleteCosmetic = async () => {
		if (!selectedCosmetic || isLoading) {
			return;
		}

		setIsLoading(true);

		try {
			const response = await api.post("/admin/deleteCosmetic.php", {
				cosmetic_id: selectedCosmetic.cosmetic_id
			});

			showNotification(response.data.message, "success");
			setSelectedCosmetic(null);
			setRefreshCount(prev => prev + 1);
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to delete cosmetic",
				"error"
			);
		} finally {
			setIsLoading(false);
		}
	};

	if (isCosmeticsLoading) {
		return <Loading />;
	}

	return (
		<section className="cosmetics">
			<div className="cosmetics-header">
				<div>
					<h1>Cosmetics</h1>
					<p className="cosmetics-subtitle">
						{cosmetics.length} {cosmetics.length == 1 ? "cosmetic" : "cosmetics"}
					</p>
				</div>

				<button
					className="cosmetics-add"
					onClick={() => setShowAddModal(true)}
					disabled={isLoading}
				>
					<Plus size={18} />
					Add Cosmetic
				</button>
			</div>

			<div className="cosmetics-tabs">
				{types.map(type => (
					<button
						key={type.cosmetic_type_id}
						className={selectedType === type.cosmetic_type_id ? "selected" : ""}
						onClick={() => handleTypeChange(type.cosmetic_type_id)}
						disabled={isLoading}
					>
						{type.code}
					</button>
				))}
			</div>

			{filteredCosmetics.length === 0 ? (
				<p className="cosmetics-empty">No cosmetics</p>
			) : (
				<div className="cosmetics-picker">
					{filteredCosmetics.map(cosmetic => (
						<button
							type="button"
							className={`cosmetic-option ${
								selectedCosmetic?.cosmetic_id === cosmetic.cosmetic_id ? "selected" : ""
							}`}
							key={cosmetic.cosmetic_id}
							onClick={() => setSelectedCosmetic(cosmetic)}
							disabled={isLoading}
						>
							{cosmetic.cosmetic_type_id == 1 ? (
								<span className="cosmetic-avatar">
									<img
										className="cosmetic-profile-picture"
										src={user.profile_picture || "/default-profile.svg"}
										alt=""
									/>
									<img
										className="cosmetic-profile-frame"
										src={cosmetic.image_url}
										alt=""
									/>
								</span>
							) : (
								<img
									className="cosmetic-background"
									src={cosmetic.image_url}
									alt=""
								/>
							)}

							<span className="cosmetic-name">{cosmetic.name}</span>

							<span className="cosmetic-price">
								<Coins size={16} />
								{cosmetic.price}
							</span>
						</button>
					))}
				</div>
			)}

			{selectedCosmetic && (
				<div className="cosmetics-actions">
					<span className="cosmetics-selection">
						{selectedCosmetic.name}
					</span>

					<button
						className="cosmetics-edit"
						onClick={() => setEditingCosmetic(selectedCosmetic)}
						disabled={isLoading}
					>
						Edit
					</button>

					<button
						className="cosmetics-delete"
						onClick={handleDeleteCosmetic}
						disabled={isLoading}
					>
						Delete Cosmetic
					</button>
				</div>
			)}

			{showAddModal && (
				<CosmeticModal
					onConfirm={handleAddCosmetic}
					onClose={() => setShowAddModal(false)}
				/>
			)}

			{editingCosmetic && (
				<CosmeticModal
					isEditing={true}
					cosmetic={editingCosmetic}
					onConfirm={handleEditCosmetic}
					onClose={() => setEditingCosmetic(null)}
				/>
			)}
		</section>
	);
}