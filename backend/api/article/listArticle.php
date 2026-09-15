<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$page = $_GET["page"] ?? 1; 
$limit = 5;

if (!is_numeric($page)) {
    http_response_code(400);
    echo json_encode([
		"success" => false, 
		"message" => "Invalid page"
	]);
    exit;
}

if ($page < 1) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Invalid page"]);
    exit;
}

$page = (int) $page;
$offset = ($page - 1) * $limit;

$stmt = $conn->prepare(
    "SELECT COUNT(*)
     FROM article a
     WHERE a.status = 1 AND a.published_at <= NOW()"
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

$stmt->bind_result($total);
$stmt->fetch();
$stmt->close();

$totalPages = (int) ceil($total / $limit);

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
     JOIN users u ON a.author_id = u.user_id
     JOIN category c ON a.category_id = c.category_id
     WHERE a.status = 1 AND a.published_at <= NOW()
     ORDER BY a.published_at DESC
	 LIMIT ? OFFSET ?"
	);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("ii", $limit, $offset);

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
    "articles" => $articles,
    "pagination" => [
        "page" => $page,
        "limit" => $limit,
        "total" => $total,
        "total_pages" => $totalPages
    ]
]);