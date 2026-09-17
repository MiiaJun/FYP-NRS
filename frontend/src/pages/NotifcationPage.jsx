import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import NotificationList from "../components/NotificationList";
import "./NewsPage.css";

export default function NotificationPage() {
	return (
		<div>
			<Header />
			<main className="page">
				<LeftSidebar />
				<NotificationList />
			</main>
		</div>
	);
}