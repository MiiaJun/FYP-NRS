import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import BookmarkList from "../components/Bookmark"
import "./NewsPage.css";

export default function BookmarkPage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<BookmarkList />
			</main>
		</div>
	);
}