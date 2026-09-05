<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

session_start();

$articleId = $_GET["id"] ?? null;

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
        SUM(reaction = 1) AS helpful_count,
        SUM(reaction = 0) AS unhelpful_count
     FROM article_reaction
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
$counts = $result->fetch_assoc();

$userReaction = null;

if (isset($_SESSION["user_id"])) {
    $userId = $_SESSION["user_id"];

    $stmt = $conn->prepare(
        "SELECT reaction
         FROM article_reaction
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
    $reaction = $result->fetch_assoc();

    if ($reaction) {
        $userReaction = (int) $reaction["reaction"];
    }
}

echo json_encode([
    "success" => true,
    "helpful_count" => (int) ($counts["helpful_count"] ?? 0),
    "unhelpful_count" => (int) ($counts["unhelpful_count"] ?? 0),
    "user_reaction" => $userReaction
]);