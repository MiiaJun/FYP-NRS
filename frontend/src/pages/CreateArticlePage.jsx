import { useState } from "react";
import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import CreateArticle from "../components/CreateArticle";
import "./NewsPage.css";

export default function CreateArticlePage() {
	const [backgroundUrl, setBackgroundUrl] = useState(null);

	return (
		<div className="article-page">
			<Header />
			{backgroundUrl && (
                <img
                    className="article-page-background"
                    src={backgroundUrl}
                    alt=""
                />
            )}
			<main className="page article-page-content">
				<LeftSidebar />
				<CreateArticle onBackgroundChange={setBackgroundUrl} />
			</main>
		</div>
	);
}