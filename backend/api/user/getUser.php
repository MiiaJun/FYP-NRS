<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$userId = $_GET["id"] ?? null;

if (!$userId || !is_numeric($userId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid user ID",
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT
        u.user_id,
        u.username,
        u.profile_picture,
		u.bio,
		(
            SELECT c.image_url
            FROM cosmetic c 
            JOIN user_equipped_cosmetic equipped ON c.cosmetic_id = equipped.cosmetic_id AND c.cosmetic_type_id = equipped.cosmetic_type_id
            WHERE equipped.user_id = u.user_id AND c.cosmetic_type_id = 1
        ) AS profile_frame_url,
        (SELECT COUNT(*)
         FROM user_subscription
         WHERE subscribed_to_id = u.user_id) AS followers_count,
        (SELECT COUNT(*)
         FROM user_subscription
         WHERE subscriber_id = u.user_id) AS following_count
     FROM users u
     WHERE u.user_id = ?"
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
    http_response_code(404);
    echo json_encode([
        "success" => false,
        "message" => "User not found",
    ]);
    exit;
}

echo json_encode([
    "success" => true,
    "user" => $user
]);