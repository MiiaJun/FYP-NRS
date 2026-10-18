<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireUser.php";

$userId = $_SESSION["user_id"];
$page = $_GET["page"] ?? "1";
$tab = $_GET["tab"] ?? "unread";
$limit = 10;

if (!ctype_digit($page) || (int) $page < 1) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid page"
	]);
	exit;
}

if (!in_array($tab, ["unread", "read"], true)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid tab"
	]);
	exit;
}

$page = (int) $page;
$offset = ($page - 1) * $limit;
$fetchLimit = $limit + 1;
$isRead = $tab === "read" ? 1 : 0;

$stmt = $conn->prepare(
	"SELECT
		n.notification_id,
		n.type,
		n.actor_id,
		n.article_id,
		n.comment_id,
		n.event_count,
		n.message,
		n.is_read,
		n.created_at,
		u.username AS actor_username
	 FROM notification n
	 LEFT JOIN users u ON u.user_id = n.actor_id
	 WHERE n.user_id = ?
	 AND n.is_read = ?
	 AND n.created_at <= NOW()
	 ORDER BY n.created_at DESC, n.notification_id DESC
	 LIMIT ? OFFSET ?"
);

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("iiii", $userId, $isRead, $fetchLimit, $offset);

if (!$stmt->execute()) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$result = $stmt->get_result();
$stmt->close();
$notifications = [];

while ($row = $result->fetch_assoc()) {
	$notifications[] = $row;
}

$hasMore = count($notifications) > $limit;

if ($hasMore) {
	array_pop($notifications);
}

echo json_encode([
	"success" => true,
	"notifications" => $notifications,
	"pagination" => [
		"page" => $page,
		"limit" => $limit,
		"has_more" => $hasMore
	]
]);