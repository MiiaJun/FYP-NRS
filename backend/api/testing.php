<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

require "../config/database.php";

$result = $conn->query("SELECT 1");

if ($result) {
    echo json_encode([
        "status" => "success",
        "message" => "Database connected!"
    ]);
} else {
    echo json_encode([
        "status" => "failed",
        "message" => $conn->error
    ]);
}