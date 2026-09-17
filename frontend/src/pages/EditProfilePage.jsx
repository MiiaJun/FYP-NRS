import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import EditProfile from "../components/EditProfile";
import "./NewsPage.css";

export default function EditProfilePage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<EditProfile />
			</main>
		</div>
	);
}