import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import EditDraft from "../components/EditDraft";
import "./NewsPage.css";

export default function EditDraftPage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<EditDraft />
			</main>
		</div>
	);
}