<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

session_start();

if (!isset($_SESSION["user_id"])) {
    echo json_encode([
        "success" => true,
        "bookmarked" => false
    ]);
    exit;
}

$articleId = $_GET["id"] ?? null;
$userId = $_SESSION["user_id"];

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);

    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID",
    ]);

    exit;
}


$stmt = $conn->prepare(
    "SELECT article_id
     FROM article_bookmark
     WHERE article_id = ? AND user_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("ii", $articleId, $userId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$bookmarked = $result->num_rows > 0;

echo json_encode([
    "success" => true,
    "bookmarked" => $bookmarked
]);