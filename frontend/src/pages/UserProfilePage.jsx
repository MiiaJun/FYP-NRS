import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import UserProfile from "../components/UserProfile"
import "./NewsPage.css";

export default function UserProfilePage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<UserProfile />
			</main>
		</div>
	);
}