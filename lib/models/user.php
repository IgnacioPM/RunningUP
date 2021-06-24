<?php
$servername = "67.207.87.141";
$username = "bd-runningup";
$password = "1234Runing";
$dbname = "running_app";
$conn= mysqli($servername,$username,$password,$dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM Usuario";
$result = $conn->query($sql);
$response = array();
if ($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        array_push($response,$row);
    }
}
$conn->close();
header('Content-Type: application/json');
echo json_encode($response);
?>