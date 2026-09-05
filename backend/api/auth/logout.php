<?php
require __DIR__ . "/../../config/cors.php";
session_start();
session_unset();
session_destroy();

echo json_encode([
	"success" => true
]);