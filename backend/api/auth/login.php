<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
session_start();

$data = json_decode(file_get_contents("php://input"), true);

$email = strtolower(trim($data["email"] ?? ""));
$password = $data["password"] ?? "";

$stmt = $conn->prepare(
	"SELECT user_id, username, email, password, profile_picture
	 FROM users
	 WHERE email = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("s", $email);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();
$user = $result->fetch_assoc();

if (!$user || !password_verify($password, $user["password"])) {
	http_response_code(401);

	echo json_encode([
		"success" => false,
		"message" => "Invalid username or password"
	]);

	exit;
}

$_SESSION["user_id"] = $user["user_id"];

echo json_encode([
    "success" => true,
    "user" => [
        "user_id" => $user["user_id"],
        "username" => $user["username"],
        "email" => $user["email"],
        "profile_picture" => $user["profile_picture"]
    ]
]);