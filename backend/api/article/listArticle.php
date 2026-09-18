<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$page = $_GET["page"] ?? "1"; 
$limit = 5;
$tab = $_GET["tab"] ?? "latest";
$categoryId = null;

if ($tab !== "latest" && $tab !== "for-you") {
	if (!ctype_digit($tab) || (int) $tab < 1) {
		http_response_code(400);
		echo json_encode([
			"success" => false,
			"message" => "Invalid tab"
		]);
		exit;
	}
	$categoryId = (int) $tab;
}

if (!ctype_digit($page) || (int) $page < 1) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid page"
	]);
	exit;
}

$page = (int) $page;
$offset = ($page - 1) * $limit;

if ($categoryId !== null) {
	$stmt = $conn->prepare(
		"SELECT COUNT(*)
		 FROM article
		 WHERE status = 1 AND published_at <= NOW() AND category_id = ?"
	);
} else {
	$stmt = $conn->prepare(
		"SELECT COUNT(*)
		 FROM article
		 WHERE status = 1 AND published_at <= NOW()"
	);
}

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

if ($categoryId !== null) {
	$stmt->bind_param("i", $categoryId);
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

if ($categoryId !== null) {
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
		 WHERE a.status = 1 AND a.published_at <= NOW() AND a.category_id = ?
		 ORDER BY a.published_at DESC
		 LIMIT ? OFFSET ?"
	);
} else {
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
}

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

if ($categoryId !== null) {
	$stmt->bind_param("iii", $categoryId, $limit, $offset);
} else {
	$stmt->bind_param("ii", $limit, $offset);
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
    "articles" => $articles,
    "pagination" => [
        "page" => $page,
        "limit" => $limit,
        "total" => $total,
        "total_pages" => $totalPages
    ]
]);