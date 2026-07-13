<?php

header("Content-Type: application/json");

echo json_encode([
    "pdo_mysql_loaded" => extension_loaded("pdo_mysql"),
    "pdo_exists" => class_exists("PDO")
]);