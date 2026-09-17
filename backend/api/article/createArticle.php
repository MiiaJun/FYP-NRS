<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../../config/sanitize.php";

session_start();

if (!isset($_SESSION["user_id"])) {
    http_response_code(401);
    echo json_encode([
        "success" => false,
        "message" => "You must be logged in",
    ]);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);

$title = trim($data["title"] ?? "");
$content = sanitizeHtml($data["content"] ?? "");
$summary = trim($data["summary"] ?? "");
$thumbnail = $data["thumbnail"] ?? null;
$status = $data["status"] ?? null;
$categoryId = $data["category_id"] ?? null;
$publishedAt = $data["published_at"] ?? null;
$userId = $_SESSION["user_id"];

if ($title === "" || $content === "" || $status === null) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Required fields are missing"
    ]);
    exit;
}

if (!$categoryId || !is_numeric($categoryId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid category ID"
    ]);
    exit;
}

if ($status != 0 && $status != 1) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid article status"
    ]);
    exit;
}

if ($status == 1) {
    if ($publishedAt) {
        $scheduledDateTime = new DateTime($publishedAt);
        $scheduledDateTime->setTimezone(new DateTimeZone("Asia/Singapore"));
        $publishedAt = $scheduledDateTime->format("Y-m-d H:i:s");

        $stmt = $conn->prepare(
            "INSERT INTO article (
                title,
                content,
                summary,
                thumbnail,
                author_id,
                status,
                published_at,
                category_id
            )
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        );
    } else {
        $stmt = $conn->prepare(
            "INSERT INTO article (
                title,
                content,
                summary,
                thumbnail,
                author_id,
                status,
                published_at,
                category_id
            )
             VALUES (?, ?, ?, ?, ?, ?, NOW(), ?)"
        );
    }
} else {
    $stmt = $conn->prepare(
        "INSERT INTO article (
            title,
            content,
            summary,
            thumbnail,
            author_id,
            status,
            published_at,
            category_id
        )
         VALUES (?, ?, ?, ?, ?, ?, NULL, ?)"
    );
}

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

if ($status == 1 && $publishedAt) {
    $stmt->bind_param(
        "ssssiisi",
        $title,
        $content,
        $summary,
        $thumbnail,
        $userId,
        $status,
        $publishedAt,
        $categoryId
    );
} else {
    $stmt->bind_param(
        "ssssiii",
        $title,
        $content,
        $summary,
        $thumbnail,
        $userId,
        $status,
        $categoryId
    );
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$articleId = $stmt->insert_id;
$stmt->close();

if ($status == 1) {
	$stmt = $conn->prepare(
		"SELECT subscriber_id
		 FROM user_subscription
		 WHERE subscribed_to_id = ?"
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

	if ($publishedAt) {
		$stmt = $conn->prepare(
			"INSERT INTO notification (
				user_id,
				actor_id,
				article_id,
				type,
				message,
				created_at
			)
			 VALUES (?, ?, ?, 1, ?, ?)"
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
			 VALUES (?, ?, ?, 1, ?, NOW())"
		);
	}

	if (!$stmt) {
		http_response_code(500);
		echo json_encode(["success" => false, "message" => "Server error"]);
		exit;
	}

	while ($subscriber = $result->fetch_assoc()) {
		$subscriberId = $subscriber["subscriber_id"];
		$message = "published a new article: " . $title;

		if ($publishedAt) {
			$stmt->bind_param(
				"iiiss",
				$subscriberId,
				$userId,
				$articleId,
				$message,
				$publishedAt
			);
		} else {
			$stmt->bind_param(
				"iiis",
				$subscriberId,
				$userId,
				$articleId,
				$message
			);
		}

		if (!$stmt->execute()) {
			http_response_code(500);
			echo json_encode(["success" => false, "message" => "Server error"]);
			exit;
		}
	}

	$stmt->close();
}

echo json_encode([
    "success" => true,
    "message" => $status == 1
        ? "Article published successfully"
        : "Article saved as draft",
]);