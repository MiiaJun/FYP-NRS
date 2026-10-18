<?php
require __DIR__ . "/../../config/cors.php";
require __DIR__ . "/../../config/database.php";
require __DIR__ . "/../utils/requireAdmin.php";

$data = json_decode(file_get_contents("php://input"), true);
$cosmeticId = $data["cosmetic_id"] ?? null;

if (!$cosmeticId || !is_numeric($cosmeticId)) {
	http_response_code(400);
	echo json_encode([
		"success" => false,
		"message" => "Invalid cosmetic ID"
	]);
	exit;
}

$stmt = $conn->prepare(
	"DELETE FROM cosmetic
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

$affectedRows = $stmt->affected_rows;
$stmt->close();

if ($affectedRows === 0) {
	http_response_code(404);
	echo json_encode([
		"success" => false,
		"message" => "Cosmetic not found"
	]);
	exit;
}

echo json_encode([
	"success" => true,
	"message" => "Cosmetic deleted"
]);