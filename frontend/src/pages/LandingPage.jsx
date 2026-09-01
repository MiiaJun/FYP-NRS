import Header from "../components/Header";
import NewsList from "../components/NewsList";
import Sidebar from "../components/Sidebar";
import './NewsPage.css'

export default function LandingPage() {
	return (
		<div>
			<Header />
			<main className="news-page">
				<Sidebar />
				<NewsList />
				<Sidebar />
			</main>
		</div>
	);
}