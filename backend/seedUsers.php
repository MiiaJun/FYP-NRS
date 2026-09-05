<?php
require __DIR__ . "/config/database.php";

$users = [
    ["Alice", "alice@test.com", "Test123!"],
    ["Bob", "bob@test.com", "Test123!"],
    ["Charlie", "charlie@test.com", "Test123!"],
    ["David", "david@test.com", "Test123!"],
    ["Emma", "emma@test.com", "Test123!"]
];

foreach ($users as $user) {
    $username = $user[0];
    $email = $user[1];
    $password = password_hash($user[2], PASSWORD_DEFAULT);
    $roleId = 1;

    $stmt = $conn->prepare(
        "INSERT INTO users (username, email, password, role_id)
         VALUES (?, ?, ?, ?)"
    );

    $stmt->bind_param("sssi", $username, $email, $password, $roleId);

    if (!$stmt->execute()) {
        echo "Failed to create $username<br>";
        continue;
    }

    echo "$username created successfully<br>";

    $stmt->close();
}