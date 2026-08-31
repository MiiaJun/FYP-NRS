import NewsList from "./NewsList";
import Sidebar from "./Sidebar";
import './NewsPage.css'

export default function NewsPage() {
    return (
        <main className="news-page">
			<Sidebar />
            <NewsList />
			<Sidebar />
        </main>
    );
}