import Header from "../components/Header";
import Sidebar from "../components/Sidebar";
import SearchList from "../components/SearchList";
import LeftSidebar from "../components/LeftSideBar";
import './NewsPage.css'

export default function SearchPage() {
	return (
		<div>
			<Header />
			<main className="news-page">
				<LeftSidebar />
				<SearchList />
				<Sidebar />
			</main>
		</div>
	);
}