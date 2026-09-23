import { useEffect, useRef, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext"
import { useModal } from "../context/ModalContext";;
import { Search, LogIn } from 'lucide-react'
import api from "../api/axios";
import ProfileMenu from './ProfileMenu';
import './Header.css'

export default function Header() {
	const { user, isLoggedIn, logout } = useAuth();
	const { openLogin, openRegister } = useModal();
	const [showProfileMenu, setShowProfileMenu] = useState(false);
	const navigate = useNavigate();
	const [keyword, setKeyword] = useState("");
	const [allTags, setAllTags] = useState([]);
	const [showSearchDropdown, setShowSearchDropdown] = useState(false);
	const [searchHistory, setSearchHistory] = useState([]);
	const searchInputRef = useRef(null);

	useEffect(() => {
		api.get("/article/listTag.php")
			.then((response) => {
				setAllTags(response.data.tags);
			});
	}, []);

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
		logout();
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
									type="button"
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
					<div className="header-profile">
						<img
							src={user.profile_picture || "/default-profile.svg"}
							alt="Profile"
							className="header-profile-picture"
							onClick={() => setShowProfileMenu(!showProfileMenu)}
						/>

						{showProfileMenu && (
							<ProfileMenu onLogout={handleLogout} />
						)}
					</div>
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