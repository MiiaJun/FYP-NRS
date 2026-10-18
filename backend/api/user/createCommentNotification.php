<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireUser.php";

$actorId = $_SESSION["user_id"];
session_write_close();
ignore_user_abort(true);

$data = json_decode(file_get_contents("php://input"), true);
$commentId = $data["comment_id"] ?? null;

if (!$commentId || !is_numeric($commentId)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid comment ID"
	]);
	exit;
}

$stmt = $conn->prepare(
	"SELECT
		c.article_id,
		c.parent_comment_id,
		a.title,
		a.author_id,
		parent.user_id AS parent_author_id
	 FROM comment c
	 JOIN article a ON c.article_id = a.article_id
	 LEFT JOIN comment parent ON c.parent_comment_id = parent.comment_id AND parent.status = 1
	 WHERE c.comment_id = ?
	 AND c.user_id = ?
	 AND c.status = 1
	 AND a.status = 1
	 AND a.published_at <= NOW()"
);

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("ii", $commentId, $actorId);

if (!$stmt->execute()) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$result = $stmt->get_result();
$stmt->close();
$comment = $result->fetch_assoc();

if (!$comment) {
	http_response_code(403);
	echo json_encode([
		"success" => false,
		"message" => "You cannot create notifications for this comment"
	]);
	exit;
}

$articleId = $comment["article_id"];
$parentCommentId = $comment["parent_comment_id"];

if ($parentCommentId === null) {
	$recipientId = $comment["author_id"];
	$type = 5;
	$message = "commented on your article: " . $comment["title"];
} else {
	$recipientId = $comment["parent_author_id"];
	$type = 6;
	$message = "replied to your comment on: " . $comment["title"];
}

if ($recipientId === null || $recipientId == $actorId) {
	echo json_encode([
		"success" => true
	]);
	exit;
}

if (!$conn->begin_transaction()) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

if ($parentCommentId === null) {
	$stmt = $conn->prepare(
		"SELECT notification_id
		 FROM notification
		 WHERE user_id = ?
		 AND article_id = ?
		 AND type = ?
		 AND is_read = 0
		 ORDER BY notification_id DESC
		 LIMIT 1"
	);
} else {
	$stmt = $conn->prepare(
		"SELECT notification_id
		 FROM notification
		 WHERE user_id = ?
		 AND article_id = ?
		 AND type = ?
		 AND parent_comment_id = ?
		 AND is_read = 0
		 ORDER BY notification_id DESC
		 LIMIT 1"
	);
}

if (!$stmt) {
	$conn->rollback();
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

if ($parentCommentId === null) {
	$stmt->bind_param("iii", $recipientId, $articleId, $type);
} else {
	$stmt->bind_param("iiii", $recipientId, $articleId, $type, $parentCommentId);
}

if (!$stmt->execute()) {
	$conn->rollback();
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$result = $stmt->get_result();
$stmt->close();
$notification = $result->fetch_assoc();

if ($notification) {
	$notificationId = $notification["notification_id"];
	
	$message = $type == 5
		? "new comments on your article: " . $comment["title"]
		: "new replies to your comment on: " . $comment["title"];

	$stmt = $conn->prepare(
		"UPDATE notification
		 SET 
		 	actor_id = ?,
			comment_id = ?,
			message = CONCAT(event_count + 1, ?),
			event_count = event_count + 1,
			created_at = NOW()
		 WHERE notification_id = ?"
	);
} else {
	$stmt = $conn->prepare(
		"INSERT INTO notification (
			user_id,
			actor_id,
			article_id,
			comment_id,
			parent_comment_id,
			type,
			message
		 )
		 VALUES (?, ?, ?, ?, ?, ?, ?)"
	);
}

if (!$stmt) {
	$conn->rollback();
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

if ($notification) {
	$stmt->bind_param("iisi", $actorId, $commentId, $message, $notificationId);
} else {
	$stmt->bind_param(
		"iiiiiis",
		$recipientId,
		$actorId,
		$articleId,
		$commentId,
		$parentCommentId,
		$type,
		$message
	);
}

if (!$stmt->execute()) {
	$conn->rollback();
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->close();

if (!$conn->commit()) {
	$conn->rollback();
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

echo json_encode([
	"success" => true
]);