<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$stmt = $conn->prepare(
    "SELECT
        a.article_id,
        a.title,
        a.published_at,
        u.username AS author,
        c.category_name AS category,
        a.trending_score
     FROM article a
     JOIN users u ON a.author_id = u.user_id
     JOIN category c ON a.category_id = c.category_id
     WHERE a.status = 1
     AND a.published_at <= NOW()
     AND a.trending_score > 0
     AND a.score_calculated_at = (
        SELECT MAX(score_calculated_at)
        FROM article
     )
     ORDER BY a.trending_score DESC, a.published_at DESC
     LIMIT 3"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();

$articles = [];

while ($article = $result->fetch_assoc()) {
    $articles[] = $article;
}

echo json_encode([
    "success" => true,
    "articles" => $articles
]);