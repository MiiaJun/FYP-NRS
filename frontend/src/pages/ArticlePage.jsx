import { useParams } from "react-router-dom";
import Header from "../components/Header";
import Sidebar from "../components/Sidebar";
import Article from "../components/Article";
import './NewsPage.css'

export default function ArticlePage() {
	const { id } = useParams();

    return (
        <div>
            <Header />
            <main className="news-page">
                <Sidebar />
                <Article />
                <Sidebar />
            </main>
        </div>
    );
}