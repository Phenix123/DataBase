<?php
$host = 'localhost';
$user = 'root';
$password = 'admin'; //To be completed if you have set a password to root
$database = 'cup'; //To be completed to connect to a database. The database must exist.
$port = NULL; //Default must be NULL to use default port

$mysqli = new mysqli($host, $user, $password, $database, $port); // connect to server

if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '
            . $mysqli->connect_error);
}
#echo '<p>Connection OK '. $mysqli->host_info.'</p>';
#echo '<p>Server '.$mysqli->server_info.'</p>';
#echo '<p>Initial charset: '.$mysqli->character_set_name().'</p>';
  
$link = mysqli_connect($host, $user, $password, $database); // connect to db

mysqli_set_charset($link, "utf8"); // change charset to utf-8

?>