import Header from "../components/Header";
import Sidebar from "../components/Sidebar";
import CreateArticle from "../components/CreateArticle";
import "./NewsPage.css";

export default function CreateArticlePage() {
	return (
		<div>
			<Header />
			<main className="page">
				<Sidebar />
				<CreateArticle />
			</main>
		</div>
	);
}