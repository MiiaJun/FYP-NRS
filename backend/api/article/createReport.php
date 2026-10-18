<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireUser.php";

$data = json_decode(file_get_contents("php://input"), true);

$userId = $_SESSION["user_id"];
$articleId = $data["article_id"] ?? null;
$commentId = $data["comment_id"] ?? null;
$reason = $data["reason"] ?? "";
$isArticle = $articleId !== null;
$targetId = $isArticle ? $articleId : $commentId;

if (($articleId === null) === ($commentId === null)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Provide an article or comment ID"
	]);
	exit;
}

if (!$targetId || !is_numeric($targetId)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid article or comment ID"
	]);
	exit;
}

if (!in_array($reason, [
	"Spam",
	"Misleading information",
	"Harassment",
	"Hate speech",
	"Inappropriate content"
], true)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid report reason"
	]);
	exit;
}

if ($isArticle) {
	$stmt = $conn->prepare(
		"INSERT INTO report (article_id, reporter_id, reason)
		 SELECT article_id, ?, ?
		 FROM article
		 WHERE article_id = ?
		 AND author_id <> ?
		 AND status = 1
		 AND published_at <= NOW()"
	);
} else {
	$stmt = $conn->prepare(
		"INSERT INTO report (comment_id, reporter_id, reason)
		 SELECT c.comment_id, ?, ?
		 FROM comment c
		 JOIN article a ON c.article_id = a.article_id
		 WHERE c.comment_id = ?
		 AND c.user_id <> ?
		 AND c.status = 1
		 AND a.status = 1
		 AND a.published_at <= NOW()"
	);
}

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("isii", $userId, $reason, $targetId, $userId);

if (!$stmt->execute()) {
	if ($stmt->errno === 1062) {
		http_response_code(409);
		echo json_encode([
			"success" => false,
			"message" => "You have already reported this content"
		]);
		exit;
	}

	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

if ($stmt->affected_rows === 0) {
	$stmt->close();
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Content is unavailable or belongs to you"
	]);
	exit;
}

$stmt->close();

echo json_encode([
	"success" => true,
	"message" => "Report submitted successfully"
]);