<?php
$host = getenv('DB_HOST') ?: 'mysql-db';
$user = getenv('DB_USER') ?: 'user';
$password = getenv('DB_PASSWORD') ?: 'user123';
$database = getenv('DB_NAME') ?: 'cs421assignment';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
