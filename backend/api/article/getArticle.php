<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$articleId = $_GET["id"] ?? null;

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);

    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID",
		"error" => "INVALID_ARTICLE_ID"
    ]);

    exit;
}

$stmt = $conn->prepare(
    "SELECT
        a.article_id,
        a.title,
        a.content,
        a.thumbnail,
        a.published_at,
        a.updated_at,
		a.status,
        u.username AS author,
        c.category_name AS category
    FROM article a
    JOIN users u ON a.author_id = u.user_id
    JOIN category c ON a.category_id = c.category_id
    WHERE a.article_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $articleId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$article = $result->fetch_assoc();

if (!$article) {
    http_response_code(404);

    echo json_encode([
        "success" => false,
        "message" => "Article not found",
		"error" => "ARTICLE_NOT_FOUND"
    ]);

    exit;
}

if ($article["status"] != 1) {
    http_response_code(404);

    echo json_encode([
        "success" => false,
        "message" => "Article is not available",
		"error" => "ARTICLE_NOT_AVAILABLE"
    ]);

    exit;
}

echo json_encode([
    "success" => true,
    "article" => $article
]);