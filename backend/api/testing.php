<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

echo json_encode([
    "MYSQLHOST" => getenv("MYSQLHOST"),
    "MYSQLPORT" => getenv("MYSQLPORT"),
    "MYSQLUSER" => getenv("MYSQLUSER"),
    "MYSQLPASSWORD" => getenv("MYSQLPASSWORD") ? "SET" : false,
    "MYSQLDATABASE" => getenv("MYSQLDATABASE"),
]);