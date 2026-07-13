<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

require __DIR__ . "/../config/database.php";

$result = $conn->query("SELECT 1");

if ($result) {
    echo json_encode([
        "message" => "Database query successful!"
    ]);
} else {
    echo json_encode([
        "message" => $conn->error
    ]);
}