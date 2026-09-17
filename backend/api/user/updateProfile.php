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

$username = trim($data["username"] ?? "");
$bio = $data["bio"] ?? "";
$profilePicture = $data["profile_picture"] ?? null;
$userId = $_SESSION["user_id"];

if ($username === "") {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Username is required"
    ]);
    exit;
}

if (mb_strlen($username) > 30) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Username must be 30 characters or less"
    ]);
    exit;
}

if (mb_strlen($bio) > 160) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Bio must be 160 characters or less"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "UPDATE users
     SET username = ?, bio = ?, profile_picture = ?
     WHERE user_id = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param(
    "sssi",
    $username,
    $bio,
    $profilePicture,
    $userId
);

if (!$stmt->execute()) {
	if ($stmt->errno === 1062) {
        http_response_code(409);
        echo json_encode([
            "success" => false,
            "message" => "Username is already taken"
        ]);
        exit;
    }
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

echo json_encode([
    "success" => true,
    "message" => "Profile updated successfully"
]);