<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../../config/openai.php";

$data = json_decode(file_get_contents("php://input"), true);

$articleId = $data["article_id"] ?? null;

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);

    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID"
    ]);

    exit;
}

$stmt = $conn->prepare(
    "SELECT summary
     FROM article_ai_summary
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
$existing = $result->fetch_assoc();
$stmt->close();

if ($existing) {
    echo json_encode([
        "success" => true,
        "summary" => $existing["summary"]
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT content
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

if (!$article) {
    http_response_code(404);

    echo json_encode([
        "success" => false,
        "message" => "Article not found"
    ]);

    exit;
}

$stmt = $conn->prepare(
    "SELECT comment_id, content, parent_comment_id
     FROM comment
     WHERE article_id = ? AND status = 1"
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
$comments = [];

while ($comment = $result->fetch_assoc()) {
    $comments[] = $comment;
}

$commentText = "";

foreach ($comments as $comment) {
    if ($comment["parent_comment_id"] === null) {

        $commentText .= "\nComment:\n";
        $commentText .= $comment["content"] . "\n";

        foreach ($comments as $reply) {

            if ($reply["parent_comment_id"] == $comment["comment_id"]) {
                $commentText .= "Reply:\n";
                $commentText .= $reply["content"] . "\n";
            }
        }
    }
}

$prompt = 
	"You are an AI assistant for a gaming news website.

	Summarize the provided article and reader comments.

	Article:
	" . $article["content"] . "

	Reader Comments:
	" . $commentText . "

	Provide exactly two sections using these exact headings:

	Article Summary:
	Write one short paragraph summarizing the main points of the article.

	Comment Summary:
	Write one short paragraph summarizing the main opinions and reactions in the comments.

	Formatting rules: - Use plain text headings exactly as written above. 
	- Do not use Markdown. - Do not add #, ##, ###, **, or other Markdown formatting. 
	- Do not add any other headings. 
	- Do not invent information that is not present in the provided text.";

$ch = curl_init("https://api.openai.com/v1/responses");

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_TIMEOUT, 30);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);

curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/json",
    "Authorization: Bearer " . $openaiApiKey
]);

curl_setopt($ch, CURLOPT_POST, true);

curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode([
    "model" => "gpt-5.6-luna",
    "input" => $prompt
]));

$response = curl_exec($ch);

if ($response === false) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "OpenAI request failed"
    ]);
    exit;
}

$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

curl_close($ch);

if ($httpCode !== 200) {
    http_response_code(502);

    echo json_encode([
        "success" => false,
        "message" => "AI service unavailable, please try again later"
    ]);

    exit;
}

$data = json_decode($response, true);

if (!$data) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Invalid OpenAI response"
    ]);
    exit;
}

if (isset($data["error"])) {
    http_response_code(502);
    echo json_encode([
        "success" => false,
        "message" => "AI service returned an error"
    ]);
    exit;
}

$summary = $data["output"][0]["content"][0]["text"] ?? null;

if ($summary === null) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "OpenAI did not return a summary"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "INSERT INTO article_ai_summary (article_id, summary)
     VALUES (?, ?)"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("is", $articleId, $summary);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->close();

echo json_encode([
    "success" => true,
    "summary" => $summary
]);