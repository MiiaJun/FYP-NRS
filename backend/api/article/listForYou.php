<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireUser.php";

$userId = $_SESSION["user_id"];
$page = $_GET["page"] ?? "1";
$limit = 5;

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

$stmt = $conn->prepare(
	"SELECT COUNT(*)
	 FROM article
	 WHERE status = 1 AND published_at <= NOW()"
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
	 ORDER BY
		(a.published_at >= NOW() - INTERVAL 14 DAY) DESC,
		CASE
			WHEN a.published_at >= NOW() - INTERVAL 14 DAY THEN
				(
					1 + CASE
						WHEN a.score_calculated_at = (
							SELECT MAX(score_calculated_at)
							FROM article
						) THEN a.trending_score
						ELSE 0
					END
				)
				* CASE WHEN EXISTS (
					SELECT 1
					FROM user_subscription
					WHERE subscriber_id = ?
					AND subscribed_to_id = a.author_id
				) THEN 1.5 ELSE 1 END
				* POW(
					0.5,
					TIMESTAMPDIFF(SECOND, a.published_at, NOW()) / 604800
				)
				* CASE WHEN EXISTS (
					SELECT 1
					FROM article_view
					WHERE user_id = ?
					AND article_id = a.article_id
					AND viewed_at >= NOW() - INTERVAL 3 DAY
				) THEN 0.2 ELSE 1 END
			ELSE
				CASE
					WHEN a.score_calculated_at = (
						SELECT MAX(score_calculated_at)
						FROM article
					) THEN a.trending_score
					ELSE 0
				END
		END DESC,
		a.published_at DESC
	 LIMIT ? OFFSET ?"
);

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("iiii", $userId, $userId, $limit, $offset);

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