<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireUser.php";

$actorId = $_SESSION["user_id"];
session_write_close();
ignore_user_abort(true);

$data = json_decode(file_get_contents("php://input"), true);
$targetId = $data["user_id"] ?? null;

if (!$targetId || !is_numeric($targetId)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid user ID"
	]);
	exit;
}

if ($targetId == $actorId) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "You cannot follow yourself"
	]);
	exit;
}

$message = "started following you";

$stmt = $conn->prepare(
	"INSERT INTO notification (
		user_id,
		actor_id,
		type,
		message
	 )
	 SELECT subscribed_to_id, subscriber_id, 7, ?
	 FROM user_subscription
	 WHERE subscriber_id = ?
	 AND subscribed_to_id = ?
	 AND NOT EXISTS (
		SELECT 1
		FROM notification
		WHERE user_id = subscribed_to_id
		AND actor_id = subscriber_id
		AND type = 7
		AND is_read = 0
	 )"
);

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("sii", $message, $actorId, $targetId);

if (!$stmt->execute()) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->close();

echo json_encode([
	"success" => true
]);