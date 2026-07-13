<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

echo json_encode([
    "mysqli_loaded" => extension_loaded("mysqli"),
    "mysqli_exists" => class_exists("mysqli")
]);