<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

session_start();

$articleId = $_GET["id"] ?? null;

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);

    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID"
    ]);

    exit;
}

if (isset($_SESSION["user_id"])) {
    $userId = $_SESSION["user_id"];

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
            u.profile_picture,
            SUM(cr.reaction = 1) AS like_count,
            SUM(cr.reaction = 0) AS dislike_count,
            MAX(CASE WHEN cr.user_id = ? THEN cr.reaction END) AS user_reaction
         FROM comment c
         JOIN users u ON c.user_id = u.user_id
         LEFT JOIN comment_reaction cr ON c.comment_id = cr.comment_id
         WHERE c.article_id = ? AND c.status = 1
         GROUP BY c.comment_id
         ORDER BY c.created_at ASC"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->bind_param("ii", $userId, $articleId);
} else {
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
            u.profile_picture,
            SUM(cr.reaction = 1) AS like_count,
            SUM(cr.reaction = 0) AS dislike_count,
            NULL AS user_reaction
         FROM comment c
         JOIN users u ON c.user_id = u.user_id
         LEFT JOIN comment_reaction cr ON c.comment_id = cr.comment_id
         WHERE c.article_id = ? AND c.status = 1
         GROUP BY c.comment_id
         ORDER BY c.created_at ASC"
    );

    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Server error"]);
        exit;
    }

    $stmt->bind_param("i", $articleId);
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();

$comments = [];

while ($comment = $result->fetch_assoc()) {
    $comment["like_count"] = (int) $comment["like_count"];
    $comment["dislike_count"] = (int) $comment["dislike_count"];

    if ($comment["user_reaction"] !== null) {
        $comment["user_reaction"] = (int) $comment["user_reaction"];
    }

    $comments[] = $comment;
}

echo json_encode([
    "success" => true,
    "comments" => $comments
]);