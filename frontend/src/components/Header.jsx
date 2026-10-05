import { useEffect, useRef, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext"
import { useModal } from "../context/ModalContext";;
import { useNotification } from "../context/NotificationContext";
import { Search, LogIn, Coins, Gem } from 'lucide-react'
import api from "../api/axios";
import ProfileMenu from './ProfileMenu';
import './Header.css'

export default function Header() {
	const navigate = useNavigate();
	const { user, isLoggedIn, logout, refreshUser, coinReward, showCoinReward, clearCoinReward } = useAuth();
	const { openLogin, openRegister } = useModal();
	const { showNotification } = useNotification();
	const [showProfileMenu, setShowProfileMenu] = useState(false);
	const [keyword, setKeyword] = useState("");
	const [allTags, setAllTags] = useState([]);
	const [showSearchDropdown, setShowSearchDropdown] = useState(false);
	const [searchHistory, setSearchHistory] = useState([]);
	const searchInputRef = useRef(null);
	const [dailyClaimed, setDailyClaimed] = useState(true);
	const [isClaiming, setIsClaiming] = useState(false);

	useEffect(() => {
		api.get("/article/listTag.php")
			.then((response) => {
				setAllTags(response.data.tags);
			})
			.catch(() => {});
	}, []);

	useEffect(() => {
		if (!isLoggedIn) {
			return;
		}

		api.get("/user/getDailyClaim.php")
			.then(response => {
				setDailyClaimed(response.data.claimed);
			})
			.catch(() => {})
	}, [isLoggedIn]);

	useEffect(() => {
		const searchHistory = localStorage.getItem("searchHistory");
		if (searchHistory) setSearchHistory(JSON.parse(searchHistory));
	}, []);

	const filteredTags = allTags.filter((tag) =>
		tag.name.toLowerCase().includes(keyword.toLowerCase())
	);

	const saveSearchHistory = (search) => {
		const updatedSearches = [
			search,
			...searchHistory.filter(
				(item) => item.toLowerCase() !== search.toLowerCase()
			),
		];

		setSearchHistory(updatedSearches);
		localStorage.setItem("searchHistory", JSON.stringify(updatedSearches));
	};

	const clearSearchHistory = () => {
		setSearchHistory([]);
		localStorage.removeItem("searchHistory");
	};

	const removeSearchHistory = (search) => {
		const updatedSearches = searchHistory.filter(
			(item) => item !== search
		);

		setSearchHistory(updatedSearches);
		localStorage.setItem("searchHistory", JSON.stringify(updatedSearches));
	};

	const handleLogout = () => {
		logout().catch(() => {});
		setShowProfileMenu(false);
	};

	const handleSearch = (keyword) => {
		const search = keyword.trim();
		if (!search) {
			return;
		}

		saveSearchHistory(search);
		setShowSearchDropdown(false);
		searchInputRef.current?.blur();

		navigate(`/search?search=${encodeURIComponent(keyword.trim())}`);
	};

	const handleDailyClaim = async () => {
		if (isClaiming) {
			return;
		}
		setIsClaiming(true);
		try {
			const response = await api.post("/user/claimDailyCoins.php");
			setDailyClaimed(true);
			await refreshUser();
			showCoinReward(response.data.amount ?? 0);
		} catch (error) {
			showNotification(
				error.response?.data?.message || "Failed to claim daily coins",
				"error"
			);
		} finally {
			setIsClaiming(false);
		}
	};

	return (
		<header className="header">
			<div className="logo" onClick={() => navigate("/")}>P</div>
			<div className="search-bar">
				<form className="search" onSubmit={(e) => { e.preventDefault(); handleSearch(keyword); }}>
					<Search size={20} />
					<input
						ref={searchInputRef}
						type="text"
						placeholder="Search"
						value={keyword}
						onFocus={() => setShowSearchDropdown(true)}
						onBlur={() => setShowSearchDropdown(false)}
						onChange={(e) => setKeyword(e.target.value)}
					/>
				</form>
				{showSearchDropdown && (
					<div className="search-dropdown">
						<div className="search-dropdown-section">
							<div className="search-dropdown-heading">
								<h3>Recent searches</h3>
								<button
									className="clear-search-history"
									onMouseDown={(e) => {
										e.preventDefault();
										clearSearchHistory();
									}}
								>
									Clear all
								</button>
							</div>
							<div className="search-history-list">
								{searchHistory.slice(0, 5).map((search) => (
									<div className="search-history-row" key={search}>
										<button
											className="search-history-item"
											onMouseDown={(e) => {
												e.preventDefault();
												handleSearch(search);
											}}
										>
											<Search size={16} />
											<span>{search}</span>
										</button>
										<button
											className="remove-search-history"
											onMouseDown={(e) => {
												e.preventDefault();
												removeSearchHistory(search);
											}}
										>
											x
										</button>
									</div>
								))}
							</div>
						</div>

						<div className="search-dropdown-section">
							<h3>Suggested tags</h3>
							<div className="suggested-tag-list">
								{filteredTags.slice(0, 6).map((tag) => (
									<button
										key={tag.tag_id}
										className="suggested-tag"
										onMouseDown={(e) => {
											e.preventDefault();
											setShowSearchDropdown(false);
											searchInputRef.current?.blur();
											navigate(`/search?tag_id=${tag.tag_id}`);
										}}
									>
										{tag.name}
									</button>
								))}
							</div>
						</div>
					</div>
				)}
				</div>
			<div className="header-actions">
				{isLoggedIn ? (
					<>
						<div className="header-wallet">
							{dailyClaimed ? (
								<button
									className="header-coins"
									onClick={() => navigate("/shop")}
								>
									<Coins size={20} />
									<span>{user.coin}</span>
								</button>
							) : (
								<button
									className="header-coins header-gem"
									onClick={handleDailyClaim}
									disabled={isClaiming}
								>
									<Gem size={20} />
								</button>
							)}
							{coinReward !== null && (
								<span
									key={coinReward.id}
									className="claim-reward"
									onAnimationEnd={clearCoinReward}
								>
									{coinReward.amount > 0 ? "+" : ""}{coinReward.amount}
								</span>
							)}
						</div>
						<div className="header-profile">
							<button
								className="header-profile-avatar"
								onClick={() => setShowProfileMenu(!showProfileMenu)}
							>
								<img
									src={user.profile_picture || "/default-profile.svg"}
									alt="Profile menu"
									className="header-profile-picture"
								/>

								{user.profile_frame_url && (
									<img
										src={user.profile_frame_url}
										alt=""
										className="header-profile-frame"
									/>
								)}
							</button>

							{showProfileMenu && (
								<ProfileMenu onLogout={handleLogout} />
							)}
						</div>
					</>
				) : (
					<>
						<button className="signup-button" onClick={openRegister}>
							Sign up
						</button>

						<button className="login-button" onClick={openLogin}>
							<LogIn size={20} />
							Log in
						</button>
					</>
				)}
			</div>
		</header>
	);
}