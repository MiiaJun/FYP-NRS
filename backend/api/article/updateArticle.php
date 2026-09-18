<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../../config/sanitize.php";

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
$title = $data["title"] ?? "";
$content = sanitizeHtml($data["content"] ?? "");
$summary = trim($data["summary"] ?? "");
$thumbnail = $data["thumbnail"] ?? null;
$status = $data["status"] ?? null;
$categoryId = $data["category_id"] ?? null;
$publishedAt = $data["published_at"] ?? null;
$userId = $_SESSION["user_id"];

if (!$articleId || !is_numeric($articleId)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid article ID"
    ]);
    exit;
}

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

$stmt = $conn->prepare(
    "SELECT author_id, status
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
    echo json_encode(["success" => false, "message" => "Article not found"]);
    exit;
}

$article = $result->fetch_assoc();

if ($article["status"] != 0 && $article["status"] != 1) {
    http_response_code(409);
    echo json_encode([
        "success" => false,
        "message" => "This article cannot be edited"
    ]);
    exit;
}

if ($article["author_id"] != $userId) {
    http_response_code(403);
    echo json_encode([
        "success" => false,
        "message" => "You cannot edit this article"
    ]);
    exit;
}

if ($article["status"] == 1 && $status == 0) {
    http_response_code(409);
    echo json_encode([
        "success" => false,
        "message" => "Published articles cannot be reverted to drafts"
    ]);
    exit;
}

if ($article["status"] == 0) {
    if ($status == 1) {
        if ($publishedAt) {
            $scheduledDateTime = new DateTime($publishedAt);
            $scheduledDateTime->setTimezone(new DateTimeZone("Asia/Singapore"));
            $publishedAt = $scheduledDateTime->format("Y-m-d H:i:s");

            $stmt = $conn->prepare(
                "UPDATE article
                 SET
                    title = ?,
                    content = ?,
                    summary = ?,
                    thumbnail = ?,
                    status = ?,
                    published_at = ?,
                    category_id = ?
                 WHERE article_id = ?"
            );
        } else {
            $stmt = $conn->prepare(
                "UPDATE article
                 SET
                    title = ?,
                    content = ?,
                    summary = ?,
                    thumbnail = ?,
                    status = ?,
                    published_at = NOW(),
                    category_id = ?
                 WHERE article_id = ?"
            );
        }
    } else {
        $stmt = $conn->prepare(
            "UPDATE article
             SET
                title = ?,
                content = ?,
                summary = ?,
                thumbnail = ?,
                status = ?,
                published_at = NULL,
                category_id = ?
             WHERE article_id = ?"
        );
    }
} else {
    $stmt = $conn->prepare(
        "UPDATE article
         SET
            title = ?,
            content = ?,
            summary = ?,
            thumbnail = ?,
            status = ?,
            updated_at = NOW(),
            category_id = ?
         WHERE article_id = ?"
    );
}

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

if ($article["status"] == 0 && $status == 1 && $publishedAt) {
    $stmt->bind_param(
        "ssssisii",
        $title,
        $content,
        $summary,
        $thumbnail,
        $status,
        $publishedAt,
        $categoryId,
        $articleId
    );
} else {
    $stmt->bind_param(
        "ssssiii",
        $title,
        $content,
        $summary,
        $thumbnail,
        $status,
        $categoryId,
        $articleId
    );
}

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->close();

if ($article["status"] == 0 && $status == 1) {
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

} elseif ($article["status"] == 1 && $status == 1) {
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

	if (!$stmt) {
		http_response_code(500);
		echo json_encode(["success" => false, "message" => "Server error"]);
		exit;
	}

	while ($subscriber = $result->fetch_assoc()) {
		$subscriberId = $subscriber["subscriber_id"];
		$message = "edited an article: " . $title;

		$stmt->bind_param(
			"iiis",
			$subscriberId,
			$userId,
			$articleId,
			$message
		);

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
    "message" => "Article updated successfully"
]);