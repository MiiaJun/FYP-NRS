import "./Sidebar.css";

const trendingNews = [
	{
		id: 1,
		category: "PC",
		author: "Noah Lim",
		time: "1 hour ago",
		title: "Grinding Gear Games wants to find ways to get new players into the old action RPG."
	},
	{
		id: 2,
		category: "PC",
		author: "Noah Lim",
		time: "2 hours ago",
		title: "In PoE's next expansion, Curse of the Allflame, socket colors."
	},
	{
		id: 3,
		category: "PC",
		author: "Elaine Tan",
		time: "4 hours ago",
		title: "The best gaming hardware announcements this week."
	}
];

const recommendedTopics = [
	"Esports",
	"PC Gaming",
	"Indie Games",
	"Hardware",
	"Reviews",
	"Retro Gaming",
	"Mobile"
];

function TrendingNews() {
	return (
		<section className="sidebar-section">
			<h2>Trending News</h2>

			<div className="trending-list">
				{trendingNews.map((article) => (
					<article className="trending-item" key={article.id}>
						<div className="trending-meta">
							In <b>{article.category}</b> by <b>{article.author}</b>
							<span>{article.time}</span>
						</div>

						<h3>{article.title}</h3>
					</article>
				))}
			</div>
		</section>
	);
}

function RecommendedTopics() {
	return (
		<section className="sidebar-section topics-section">
			<h2>Recommended Topics</h2>

			<div className="topic-list">
				{recommendedTopics.map((topic) => (
					<button type="button" className="topic-pill" key={topic}>
						{topic}
					</button>
				))}
			</div>
		</section>
	);
}

export default function Sidebar() {
	return (
		<aside className="sidebar">
			<TrendingNews />
			<RecommendedTopics />
		</aside>
	);
}