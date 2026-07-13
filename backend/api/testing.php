<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

require __DIR__ . "/../config/database.php";

$data = json_decode(file_get_contents("php://input"), true);

$name = $data["name"];

$stmt = $conn->prepare("INSERT INTO test (name) VALUES (?)");
$stmt->bind_param("s", $name);

if ($stmt->execute()) {
    echo json_encode([
        "success" => true,
        "message" => "Inserted successfully"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => $stmt->error
    ]);
}