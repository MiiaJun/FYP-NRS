<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

session_start();

if (!isset($_SESSION["user_id"])) {
    http_response_code(401);
    echo json_encode([
        "success" => false,
        "message" => "You must be logged in",
    ]);
    exit;
}

$actorId = $_SESSION["user_id"];	
session_write_close();
ignore_user_abort(true);

$data = json_decode(file_get_contents("php://input"), true);
$type = $data["type"] ?? null;
$articleId = $data["article_id"] ?? null;

if ($type != 1 && $type != 2) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid notification type",
    ]);
    exit;
}

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID",
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT
        title,
        published_at
     FROM article
     WHERE article_id = ? AND author_id = ? AND status = 1"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("ii", $articleId, $actorId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$article = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$article) {
    http_response_code(403);
    echo json_encode([
        "success" => false,
        "message" => "You cannot create notifications for this article",
    ]);
    exit;
}

$message = $type == 1
    ? "published a new article: " . $article["title"]
    : "edited an article: " . $article["title"];

if ($type == 1) {
    $stmt = $conn->prepare(
        "INSERT INTO notification (
            user_id,
            actor_id,
            article_id,
            type,
            message,
            created_at
        )
        SELECT
            subscriber_id,
            ?,
            ?,
            ?,
            ?,
            ?
        FROM user_subscription
        WHERE subscribed_to_id = ?"
    );
} else {
	$stmt = $conn->prepare(
        "INSERT INTO notification (
            user_id,
            actor_id,
            article_id,
            type,
            message,
            created_at
        )
        SELECT
            subscriber_id,
            ?,
            ?,
            ?,
            ?,
            NOW()
        FROM user_subscription
        WHERE subscribed_to_id = ?"
    );
}

if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
}

if ($type == 1) {
	$stmt->bind_param(
        "iiissi",
        $actorId,
        $articleId,
        $type,
        $message,
        $article["published_at"],
        $actorId
	);
} else {
	$stmt->bind_param(
        "iiisi",
        $actorId,
        $articleId,
        $type,
        $message,
        $actorId
    );
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->close();

echo json_encode([
    "success" => true,
]);