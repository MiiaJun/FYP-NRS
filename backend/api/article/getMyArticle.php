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
$articleId = $_GET["id"] ?? null;

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT author_id
     FROM article
     WHERE article_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $articleId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();

if ($result->num_rows === 0) {
    http_response_code(404);
    echo json_encode([
        "success" => false,
        "message" => "Article not found"
    ]);
    exit;
}

$article = $result->fetch_assoc();

if ($article["author_id"] != $userId) {
    http_response_code(403);
    echo json_encode([
        "success" => false,
        "message" => "You cannot edit this article"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT
        article_id,
        title,
        content,
        summary,
        thumbnail,
        category_id
     FROM article
     WHERE article_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $articleId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$article = $result->fetch_assoc();

echo json_encode([
    "success" => true,
    "article" => $article
]);