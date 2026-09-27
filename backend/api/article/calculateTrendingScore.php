<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

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
            COALESCE(av.recent_views, 0)
            + COALESCE(bookmark.recent_bookmarks, 0) * 3
            + COALESCE(reaction.recent_helpful_reactions, 0) * 2,
        a.score_calculated_at = NOW()

     WHERE a.status = 1
     AND a.published_at <= NOW()
     AND av.article_id IS NOT NULL"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Failed to calculate trending scores"]);
    exit;
}

$stmt->close();

echo json_encode([
    "success" => true,
    "message" => "Trending scores calculated successfully"
]);