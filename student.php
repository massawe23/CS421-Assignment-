<?php

header("Content-Type: application/json");
require_once('db.php');


// Get the students
$sql = "SELECT student_name, program FROM student";
$result = $conn->query($sql);

$students = [];

if($result->num_rows > 0){
    while($rows = $result->fetch_assoc()){
        $students[] = $rows;
    }
}

echo json_encode($students);