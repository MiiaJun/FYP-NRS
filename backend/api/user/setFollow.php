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

$subscriberId = (int) $_SESSION["user_id"];
$data = json_decode(file_get_contents("php://input"), true);
$subscribedToId = $data["user_id"] ?? null;

if (!$subscribedToId || !is_numeric($subscribedToId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid user ID"
    ]);
    exit;
}

$subscribedToId = (int) $subscribedToId;

if ($subscriberId === $subscribedToId) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "You cannot follow yourself"
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

$stmt->bind_param("ii", $subscriberId, $subscribedToId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$existingFollow = $result->fetch_assoc();

if ($existingFollow) {
    $stmt = $conn->prepare(
        "DELETE FROM user_subscription
         WHERE subscriber_id = ? AND subscribed_to_id = ?"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->bind_param("ii", $subscriberId, $subscribedToId);

    if (!$stmt->execute()) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->close();
    $following = false;
} else {
    $stmt = $conn->prepare(
        "INSERT INTO user_subscription (subscriber_id, subscribed_to_id)
         VALUES (?, ?)"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->bind_param("ii", $subscriberId, $subscribedToId);

    if (!$stmt->execute()) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->close();
    $following = true;
}

$stmt = $conn->prepare(
    "SELECT COUNT(*)
     FROM user_subscription
     WHERE subscribed_to_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $subscribedToId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_result($followersCount);
$stmt->fetch();
$stmt->close();

echo json_encode([
    "success" => true,
    "following" => $following,
    "followers_count" => $followersCount
]);