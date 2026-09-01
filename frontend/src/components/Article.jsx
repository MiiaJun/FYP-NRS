import ArticleActions from "./ArticleActions";
import CommentList from "./CommentList";
import "./Article.css";

export default function Article() {
    const article = {
        article_id: 1,
        title: "Nintendo Announces a New Adventure",
        summary: "Nintendo has announced a brand-new adventure coming to the Switch.",
        author: "Miia",
        category: "Nintendo",
        published_at: "31 August 2026",
        thumbnail: "https://media.discordapp.net/attachments/387900429276807170/1401143064747311165/test1.jpg?ex=6a96a2aa&is=6a95512a&hm=6deeb7936bb870fcb66e1a86ab0de2b343f9e0e06b3cfb4128334fefbf91a9bc&=&format=webp",

        content: `
    <p>
        Nintendo has announced a brand-new adventure coming to the Switch,
        introducing players to a completely new world filled with new
        characters, challenges, and discoveries.
    </p>

    <p>
        The announcement comes after months of speculation from fans, who have
        been waiting to see what Nintendo has planned for its next major
        release. While details are still limited, the company has confirmed
        that the game is being designed specifically with exploration and
        discovery in mind.
    </p>

    <img
        src="https://media.discordapp.net/attachments/688575073149517856/1543258438639943791/pso2_2026-08-29_17-56-09_103.png?ex=6a9782ac&is=6a96312c&hm=5c962b3d1c7699fbbd6eac0b58288c88edef9d6235d07e757b5619e256087034&=&format=webp&quality=lossless"
        alt="Nintendo Switch"
    />

    <p>
        According to the developers, the new adventure will feature a larger
        world than previous games in the series. Players will be able to
        explore different environments, discover hidden locations, and
        interact with characters that they encounter throughout their journey.
    </p>

    <h2>A New Adventure</h2>

    <p>
        One of the biggest changes is the way the world is designed. Instead
        of following a completely linear path, players will have more freedom
        to decide where they want to go and how they want to approach
        different challenges.
    </p>

    <p>
        Nintendo says that exploration will play an important role in the
        experience. Areas that initially appear to be inaccessible may contain
        alternative paths, hidden items, or secrets that can only be discovered
        by paying close attention to the environment.
    </p>

    <h2>New Characters and Gameplay</h2>

    <p>
        The game will also introduce several new characters. Each character
        will have their own personality and role within the story, with some
        characters helping the player while others may present unexpected
        challenges.
    </p>

    <p>
        Gameplay has also been expanded with several new mechanics. Nintendo
        has highlighted improved movement, new abilities, and additional ways
        for players to interact with the environment.
    </p>

    <ul>
        <li>Explore a large new world</li>
        <li>Meet new characters</li>
        <li>Discover hidden areas and secrets</li>
        <li>Use new abilities and gameplay mechanics</li>
        <li>Experience a new story and adventure</li>
    </ul>

    <p>
        These changes are intended to make exploration feel more rewarding.
        Rather than simply moving from one objective to another, players will
        have reasons to explore areas that are not directly connected to the
        main story.
    </p>

    <img
        src="https://media.discordapp.net/attachments/387900429276807170/1544371906327609515/image_1.png?ex=6a9843eb&is=6a96f26b&hm=43aac99bcd267f1dbfe4f4ce0a6fb8c4762e8dabb29f257f1476d9b984ccd172&=&format=webp&quality=lossless&width=575&height=1024"
        alt="Gameplay"
    />

    <h2>What We Know So Far</h2>

    <p>
        Although Nintendo has revealed some information about the project,
        many details remain unknown. The company has not yet revealed the
        complete release schedule, and fans are still waiting for more
        information about the story and characters.
    </p>

    <blockquote>
        "We wanted to create an adventure that rewards players for being
        curious and exploring the world around them."
    </blockquote>

    <p>
        More information is expected to be revealed in the coming months.
        Nintendo has promised that additional details about the game,
        including gameplay footage and information about its release, will be
        shared at a later date.
    </p>

    <p>
        Until then, fans will have plenty to speculate about. With a new world,
        new characters, and a stronger focus on exploration, the upcoming
        adventure could become one of the most interesting releases on the
        Switch.
    </p>

    <p>
        For now, Nintendo has asked players to stay tuned for further
        announcements. Whether the game can live up to the expectations
        surrounding it remains to be seen, but there is already considerable
        excitement surrounding its reveal.
    </p>
`
    };

    return (
		<div className="article">
			<article>
				<div className="article-meta">
					In <b>{article.category}</b> by <b>{article.author}</b> • {article.published_at}
				</div>
				<h1>{article.title}</h1>
				<img
					className="article-thumbnail"
					src={article.thumbnail}
					alt={article.title}
				/>
				<div
					className="article-body"
					dangerouslySetInnerHTML={{
						__html: article.content
					}}
				/>
				<ArticleActions articleId={article.article_id} />
			</article>
			<CommentList articleId={article.article_id} />
		</div>
    );
}