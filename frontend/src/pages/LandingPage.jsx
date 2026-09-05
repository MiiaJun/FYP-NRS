import Header from "../components/Header";
import Sidebar from "../components/Sidebar";
import NewsList from "../components/NewsList";
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