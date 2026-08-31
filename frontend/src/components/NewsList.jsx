import NewsCard from "./NewsCard";

const articles = [
    {
        id: 1,
        title: "New Gaming Technology Announced",
        description: "The latest technology is changing the gaming industry.",
        category: "Hardware",
        date: "25 Aug 2026",
        image: "",
		author: "John",
        trending: true,
    },
    {
        id: 2,
        title: "Major Update Coming to Popular Game",
        description: "Developers have announced a major upcoming update.",
        category: "PC Gaming",
        date: "24 Aug 2026",
        image: "",
		author: "John",
        trending: false,
    },
    {
        id: 3,
        title: "Indie Game Gains Huge Popularity",
        description: "A new indie title is quickly becoming popular.",
        category: "Indie Games",
        date: "23 Aug 2026",
        image: "",
		author: "John",
        trending: false,
    },
];

export default function NewsList() {
    return (
        <section className="news-list">
            {articles.map((article) => (
                <NewsCard
                    key={article.id}
                    article={article}
                />
            ))}
        </section>
    );
}