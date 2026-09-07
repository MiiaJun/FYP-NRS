import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import MyProfile from "../components/MyProfile";
import "./NewsPage.css";

export default function ProfilePage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<MyProfile />
			</main>
		</div>
	);
}