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
		u.user_id,
		u.username,
		u.profile_picture
	 FROM users u
	 JOIN user_subscription s ON u.user_id = s.subscribed_to_id
	 WHERE s.subscriber_id = ?
	 ORDER BY u.username ASC"
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
$users = [];

while ($user = $result->fetch_assoc()) {
    $users[] = $user;
}

echo json_encode([
    "success" => true,
    "users" => $users
]);