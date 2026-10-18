<?php
if (PHP_SAPI !== "cli") {
	http_response_code(404);
	exit;
}

require __DIR__ . "/../config/database.php";

$stmt = $conn->prepare(
    "UPDATE article a
     LEFT JOIN (
        SELECT
            article_id,
            COUNT(*) AS recent_views
        FROM article_view
        WHERE viewed_at >= NOW() - INTERVAL 48 HOUR
        GROUP BY article_id
     ) av ON av.article_id = a.article_id

     LEFT JOIN (
        SELECT
            article_id,
            COUNT(*) AS recent_bookmarks
        FROM article_bookmark
        WHERE created_at >= NOW() - INTERVAL 48 HOUR
        GROUP BY article_id
     ) bookmark ON bookmark.article_id = a.article_id

     LEFT JOIN (
        SELECT
            article_id,
            COUNT(*) AS recent_helpful_reactions
        FROM article_reaction
        WHERE reaction = 1
        AND reacted_at >= NOW() - INTERVAL 48 HOUR
        GROUP BY article_id
     ) reaction ON reaction.article_id = a.article_id

     SET
        a.trending_score =
            SQRT(COALESCE(av.recent_views, 0) * 10)
            + COALESCE(bookmark.recent_bookmarks, 0) * 3
            + COALESCE(reaction.recent_helpful_reactions, 0) * 2,
        a.score_calculated_at = NOW()

     WHERE a.status = 1
     AND a.published_at <= NOW()
     AND av.article_id IS NOT NULL"
);

if (!$stmt) {
	fwrite(STDERR, "Server error: {$conn->error}\n");
	exit(1);
}

if (!$stmt->execute()) {
	fwrite(STDERR, "Failed to calculate article trending scores: {$stmt->error}\n");
	exit(1);
}

$stmt->close();

$stmt = $conn->prepare(
	"UPDATE tag t
	 LEFT JOIN (
		SELECT at.tag_id, SUM(a.trending_score) AS total_score
		FROM article_tag at
		JOIN article a ON a.article_id = at.article_id
		WHERE a.status = 1
		AND a.published_at <= NOW()
		AND a.score_calculated_at = (
			SELECT MAX(score_calculated_at)
			FROM article
		)
		GROUP BY at.tag_id
	 ) scores ON t.tag_id = scores.tag_id
	 SET t.trending_score = COALESCE(scores.total_score, 0)"
);

if (!$stmt) {
	fwrite(STDERR, "Server error: {$conn->error}\n");
	exit(1);
}

if (!$stmt->execute()) {
	fwrite(STDERR, "Failed to calculate topic scores: {$stmt->error}\n");
	exit(1);
}

$stmt->close();

echo "Article and topic trending scores calculated successfully\n";