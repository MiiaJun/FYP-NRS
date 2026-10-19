<?php
mysqli_report(MYSQLI_REPORT_OFF);

$host = getenv("MYSQLHOST");
$port = getenv("MYSQLPORT");
$user = getenv("MYSQLUSER");
$password = getenv("MYSQLPASSWORD");
$database = getenv("MYSQLDATABASE");

$conn = new mysqli(
    $host,
    $user,
    $password,
    $database,
    $port
);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error"]);
    exit;
}

$conn->set_charset("utf8mb4");
$conn->query("SET time_zone = '+08:00'");