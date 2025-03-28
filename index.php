<?php

header("Content-Type: application/json");

// Get requested URL
$request = $_SERVER['REQUEST_URI'];

switch($request){
    case "/student":
        require "student.php";
        break;

    case "subjects":
        require "subjects.php";
        break;

    default:
        echo json_encode(["message" => "Invalid endpoint"]);
        break;
}