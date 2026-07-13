<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

require "/../config/database.php";

$result = $conn->query("SELECT 1");

if ($result) {
    echo "Database query successful!!";
} else {
    echo "Query failed: " . $conn->error;
}