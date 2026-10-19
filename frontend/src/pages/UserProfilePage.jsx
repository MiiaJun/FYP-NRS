import { useParams } from "react-router-dom";
import LeftSidebar from "../components/LeftSideBar";
import UserProfile from "../components/UserProfile";
import "./NewsPage.css";

export default function UserProfilePage() {
	const { id } = useParams();

	return (
		<div>
			<main className="page">
				<LeftSidebar />
				<UserProfile key={id} />
			</main>
		</div>
	);
}