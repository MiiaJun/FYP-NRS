<?php

header("Content-Type: application/json");

echo json_encode([
    "MYSQL_HOST" => getenv("MYSQL_HOST"),
    "MYSQL_PORT" => getenv("MYSQL_PORT"),
    "MYSQL_USER" => getenv("MYSQL_USER"),
    "MYSQL_DATABASE" => getenv("MYSQL_DATABASE"),
]);