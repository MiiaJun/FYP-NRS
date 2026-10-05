import { useState } from "react";
import Header from "../components/Header";
import LeftSidebar from "../components/LeftSideBar";
import EditPublished from "../components/EditPublished";
import "./NewsPage.css";

export default function EditDraftPage() {
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
				<EditPublished onBackgroundChange={setBackgroundUrl} />
			</main>
		</div>
	);
}