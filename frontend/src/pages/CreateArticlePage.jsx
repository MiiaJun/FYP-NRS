import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import CreateArticle from "../components/CreateArticle";
import "./NewsPage.css";

export default function CreateArticlePage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<CreateArticle />
			</main>
		</div>
	);
}