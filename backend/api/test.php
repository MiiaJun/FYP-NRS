<?php

require __DIR__ . "/../config/cors.php";
require __DIR__ . "/../config/database.php";

$result = $conn->query("SELECT 1 AS ok");
$row = $result->fetch_assoc();

echo json_encode([
	"success" => true,
	"database" => $row["ok"]
]);