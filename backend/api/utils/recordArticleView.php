<?php
function recordArticleView($conn, $articleId)
{
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    $userId = $_SESSION["user_id"] ?? null;
    $viewerKey = hash("sha256", session_id());

    if ($userId !== null) {
        $stmt = $conn->prepare(
            "SELECT 1
             FROM article_view
             WHERE article_id = ? AND user_id = ?
             LIMIT 1"
        );

        if (!$stmt) {
            return;
        }

        $stmt->bind_param("ii", $articleId, $userId);

        if (!$stmt->execute()) {
            $stmt->close();
            return;
        }

        $existingView = $stmt->get_result()->fetch_assoc();
        $stmt->close();

        if ($existingView) {
            $stmt = $conn->prepare(
                "UPDATE article_view
                 SET viewed_at = NOW()
                 WHERE article_id = ? AND user_id = ?"
            );

            if (!$stmt) {
                return;
            }

            $stmt->bind_param("ii", $articleId, $userId);
            $stmt->execute();
            $stmt->close();
            return;
        }
    }

    $stmt = $conn->prepare(
        "INSERT INTO article_view (article_id, user_id, viewer_key)
         VALUES (?, ?, ?)
         ON DUPLICATE KEY UPDATE
            user_id = COALESCE(VALUES(user_id), user_id),
            viewed_at = NOW()"
    );

    if (!$stmt) {
        return;
    }

    $stmt->bind_param("iis", $articleId, $userId, $viewerKey);
    $stmt->execute();
    $stmt->close();
}