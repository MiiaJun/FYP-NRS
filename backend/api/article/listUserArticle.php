<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$userId = $_GET["user_id"] ?? null;

if (!$userId || !is_numeric($userId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid user ID"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT
        a.article_id,
        a.title,
        a.summary,
        a.thumbnail,
        a.published_at,
        a.updated_at,
		u.username AS author,
        c.category_name AS category
     FROM article a
     JOIN category c ON a.category_id = c.category_id
     JOIN users u ON a.author_id = u.user_id
     WHERE a.author_id = ? AND a.status = 1 AND a.published_at <= NOW()
     ORDER BY a.published_at DESC"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $userId);

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