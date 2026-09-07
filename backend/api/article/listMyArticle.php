<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

session_start();

if (!isset($_SESSION["user_id"])) {
    http_response_code(401);
    echo json_encode([
        "success" => false,
        "message" => "You must be logged in"
    ]);
    exit;
}

$userId = $_SESSION["user_id"];

$stmt = $conn->prepare(
    "SELECT
        a.article_id,
        a.title,
        a.summary,
        a.thumbnail,
        a.published_at,
        a.updated_at,
        a.status,
        c.category_name AS category,
        u.username AS author
     FROM article a
     JOIN category c ON a.category_id = c.category_id
     JOIN users u ON a.author_id = u.user_id
     WHERE a.author_id = ?
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
$published = [];
$drafts = [];

while ($article = $result->fetch_assoc()) {
	if ($article["status"] == 1) {
		$published[] = $article;
	} elseif ($article["status"] == 0) {
		$drafts[] = $article;
	}
}

echo json_encode([
    "success" => true,
    "published" => $published,
    "drafts" => $drafts
]);