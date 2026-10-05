<?php
function recordArticleView($conn, $articleId)
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    $userId = $_SESSION["user_id"] ?? null;
    $viewerKey = hash(
        "sha256",
        $userId !== null
            ? "user:" . $userId
            : "guest:" . session_id()
    );

    $stmt = $conn->prepare(
        "INSERT INTO article_view (article_id, user_id, viewer_key)
         VALUES (?, ?, ?)
         ON DUPLICATE KEY UPDATE
            viewed_at = NOW()"
    );

    if (!$stmt) {
        return;
    }

    $stmt->bind_param("iis", $articleId, $userId, $viewerKey);

    if (!$stmt->execute()) {
		return;
	}
	
    $stmt->close();
}