<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$data = json_decode(file_get_contents("php://input"), true);
$token = $data["token"] ?? "";
$password = $data["password"] ?? "";

if (!is_string($token) || !preg_match("/^[a-f0-9]{64}$/", $token)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid reset link"
    ]);
    exit;
}

if (!is_string($password) || !preg_match("/^(?!\s)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\S$).{8,}$/u", $password)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Password must be at least 8 characters, include an uppercase letter, lowercase letter, and number, and cannot start or end with spaces"
    ]);
    exit;
}

$tokenHash = hash("sha256", $token);
$hashedPassword = password_hash($password, PASSWORD_DEFAULT);

if (!$conn->begin_transaction()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT token_id, user_id
     FROM account_token
     WHERE token_hash = ? AND expire_at > NOW()
     FOR UPDATE"
);

if (!$stmt) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("s", $tokenHash);

if (!$stmt->execute()) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$tokenRecord = $result->fetch_assoc();

if (!$tokenRecord) {
    $conn->rollback();
    http_response_code(400);
    echo json_encode([
        "success" => false,
		"code" => "INVALID_RESET_TOKEN",
        "message" => "Reset link is invalid or expired. Request a new link."
    ]);
    exit;
}

$userId = $tokenRecord["user_id"];
$tokenId = $tokenRecord["token_id"];

$stmt = $conn->prepare(
    "UPDATE users SET password = ? WHERE user_id = ?"
);

if (!$stmt) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("si", $hashedPassword, $userId);

if (!$stmt->execute()) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Failed to reset password"
    ]);
    exit;
}

$stmt->close();

$stmt = $conn->prepare(
    "DELETE FROM account_token WHERE token_id = ?"
);

if (!$stmt) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("i", $tokenId);

if (!$stmt->execute()) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->close();

if (!$conn->commit()) {
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

echo json_encode([
    "success" => true,
    "message" => "Password reset successfully. You can now log in."
]);