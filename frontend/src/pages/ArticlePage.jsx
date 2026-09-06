import Header from "../components/Header";
import Sidebar from "../components/Sidebar";
import LeftSidebar from "../components/LeftSideBar";
import Article from "../components/Article";
import './NewsPage.css'

export default function ArticlePage() {
    return (
        <div>
            <Header />
            <main className="news-page">
                <LeftSidebar />
                <Article />
                <Sidebar />
            </main>
        </div>
    );
}