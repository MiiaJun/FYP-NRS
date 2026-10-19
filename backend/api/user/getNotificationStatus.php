<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireUser.php";

$userId = $_SESSION["user_id"];

$stmt = $conn->prepare(
	"SELECT notification_id
	 FROM notification
	 WHERE user_id = ?
	 AND is_read = 0
	 AND created_at <= NOW()
	 LIMIT 1"
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

echo json_encode([
	"success" => true,
	"has_unread" => $result->num_rows > 0
]);