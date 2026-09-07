import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import EditPublished from "../components/EditPublished";
import "./NewsPage.css";

export default function EditDraftPage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<EditPublished />
			</main>
		</div>
	);
}