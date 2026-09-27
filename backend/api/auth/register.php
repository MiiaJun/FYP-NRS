<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";

$data = json_decode(file_get_contents("php://input"), true);

$username = $data["username"] ?? "";
$email = strtolower(trim($data["email"] ?? ""));
$password = $data["password"] ?? "";

if ($username === "" || $email === "" || $password === "") {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "All fields are required"
    ]);
    exit;
}

if (!preg_match("/^(?!\s).{2,30}(?<!\s)$/u", $username)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Username must be 2 to 30 characters and cannot start or end with spaces"
    ]);
    exit;
}

if (!preg_match("/^(?!\s)(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\S$).{8,}$/u", $password)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Password must be at least 8 characters, include an uppercase letter, lowercase letter, and number, and cannot start or end with spaces"
    ]);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode([
        "success" => false,
        "message" => "Invalid email format"
    ]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT user_id FROM users WHERE username = ? OR email = ?"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param("ss", $username, $email);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$result = $stmt->get_result();
$stmt->close();

if ($result->num_rows > 0) {
    http_response_code(409);

    echo json_encode([
        "success" => false,
        "message" => "Username or email already exists"
    ]);

    exit;
}

$hashedPassword = password_hash($password, PASSWORD_DEFAULT);
$roleId = 1;

$stmt = $conn->prepare(
    "INSERT INTO users (username, email, password, role_id)
     VALUES (?, ?, ?, ?)"
);

if (!$stmt) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->bind_param(
    "sssi",
    $username,
    $email,
    $hashedPassword,
    $roleId
);

if (!$stmt->execute()) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$stmt->close();

echo json_encode([
    "success" => true,
    "message" => "Account created successfully"
]);