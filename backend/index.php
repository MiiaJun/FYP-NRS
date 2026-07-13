<?php

$host = getenv('MYSQLHOST');
$port = getenv('MYSQLPORT');
$db   = getenv('MYSQLDATABASE');
$user = getenv('MYSQLUSER');
$pass = getenv('MYSQLPASSWORD');

$mysqli = new mysqli($host, $user, $pass, $db, $port);

if ($mysqli->connect_error) {
    http_response_code(500);
    die('DB connection failed: ' . $mysqli->connect_error);
}

$result = $mysqli->query('SELECT 1 AS ok');
$row = $result->fetch_assoc();

echo "Connected. Result: " . $row['ok'];

$mysqli->close();