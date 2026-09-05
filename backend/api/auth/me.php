<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
session_start();

if (!isset($_SESSION["user_id"])) {
	echo json_encode([
		"success" => false,
		"user" => null
	]);

	exit;
}

$userId = $_SESSION["user_id"];

$stmt = $conn->prepare(
	"SELECT user_id, username, email, profile_picture, role_id, status, suspended_until
     FROM users
     WHERE user_id = ?"
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
$user = $result->fetch_assoc();

if (!$user) {
	session_unset();
    session_destroy();

    http_response_code(401);

    echo json_encode([
        "success" => false,
        "message" => "User not found"
    ]);

    exit;
}

echo json_encode([
    "success" => true,
    "user" => $user
]);