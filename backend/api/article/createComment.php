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

$data = json_decode(file_get_contents("php://input"), true);

$articleId = $data["article_id"] ?? null;
$parentCommentId = $data["parent_comment_id"] ?? null;
$content = trim($data["content"] ?? "");
$userId = $_SESSION["user_id"];

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID"
    ]);
    exit;
}

if ($content === "") {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Comment cannot be empty"
    ]);
    exit;
}

if ($parentCommentId === null) {
    $stmt = $conn->prepare(
        "INSERT INTO comment (article_id, user_id, content)
         VALUES (?, ?, ?)"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->bind_param("iis", $articleId, $userId, $content);
} else {
    if (!is_numeric($parentCommentId)) {
        http_response_code(400);
        echo json_encode([
            "success" => false,
            "message" => "Invalid parent comment ID"
        ]);
        exit;
    }

    $stmt = $conn->prepare(
        "INSERT INTO comment (article_id, user_id, content, parent_comment_id)
         VALUES (?, ?, ?, ?)"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->bind_param("iisi", $articleId, $userId, $content, $parentCommentId);
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$commentId = $stmt->insert_id;
$stmt->close();

$stmt = $conn->prepare(
    "SELECT
        c.comment_id,
        c.article_id,
        c.user_id,
        c.content,
        c.parent_comment_id,
        c.created_at,
        c.updated_at,
        u.username,
        u.profile_picture
     FROM comment c
     JOIN users u ON c.user_id = u.user_id
     WHERE c.comment_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $commentId);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();

$comment = $result->fetch_assoc();

echo json_encode([
    "success" => true,
    "comment" => $comment
]);