<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireAdmin.php";

$data = json_decode(file_get_contents("php://input"), true);
$cosmeticId = $data["cosmetic_id"] ?? null;
$name = $data["name"] ?? "";
$imageUrl = $data["image_url"] ?? "";
$typeId = $data["cosmetic_type_id"] ?? null;
$price = $data["price"] ?? null;

if (!$cosmeticId || !is_numeric($cosmeticId)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid cosmetic ID"
	]);
	exit;
}

if (!is_string($name) || !is_string($imageUrl)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid cosmetic details"
	]);
	exit;
}

$name = trim($name);

if ($name === "" || $imageUrl === "") {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Name and image are required"
	]);
	exit;
}

if (mb_strlen($name) > 30) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Cosmetic name cannot exceed 30 characters"
	]);
	exit;
}

if (!is_numeric($typeId)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid cosmetic type"
	]);
	exit;
}

if (!is_numeric($price) || $price < 0) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid cosmetic price"
	]);
	exit;
}

$stmt = $conn->prepare(
	"SELECT cosmetic_id
	 FROM cosmetic
	 WHERE cosmetic_id = ?"
);

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("i", $cosmeticId);

if (!$stmt->execute()) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$result = $stmt->get_result();
$stmt->close();

if ($result->num_rows === 0) {
	http_response_code(404);
	echo json_encode([
		"success" => false,
		"message" => "Cosmetic not found"
	]);
	exit;
}

$stmt = $conn->prepare(
	"UPDATE cosmetic
	 SET cosmetic_type_id = ?, name = ?, image_url = ?, price = ?
	 WHERE cosmetic_id = ?"
);

if (!$stmt) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->bind_param("issii", $typeId, $name, $imageUrl, $price, $cosmeticId);

if (!$stmt->execute()) {
	http_response_code(500);
	echo json_encode(["success" => false, "message" => "Server error"]);
	exit;
}

$stmt->close();

echo json_encode([
	"success" => true,
	"message" => "Cosmetic updated"
]);