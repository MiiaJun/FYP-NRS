<?php

$host = getenv("MYSQL_HOST");
$port = getenv("MYSQL_PORT");
$user = getenv("MYSQL_USER");
$password = getenv("MYSQL_PASSWORD");
$database = getenv("MYSQL_DATABASE");

$conn = new mysqli(
    $host,
    $user,
    $password,
    $database,
    $port
);

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}