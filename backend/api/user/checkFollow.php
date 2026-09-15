<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

session_start();

if (!isset($_SESSION["user_id"])) {
    echo json_encode([
        "success" => true,
        "following" => false
    ]);
    exit;
}

$subscriberId = $_SESSION["user_id"];
$userId = $_GET["id"] ?? null;

if (!$userId || !is_numeric($userId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid user ID"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT subscriber_id
     FROM user_subscription
     WHERE subscriber_id = ? AND subscribed_to_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("ii", $subscriberId, $userId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$following = $result->num_rows > 0;

echo json_encode([
    "success" => true,
    "following" => $following
]);