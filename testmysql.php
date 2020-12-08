<?php
/*
* Change the value of $password if you have set a password on the root userid
* Change NULL to port number to use DBMS other than the default using port 3306
*
*/
$host = 'localhost';
$user = 'root';
$password = ''; //To be completed if you have set a password to root
$database = 'cup'; //To be completed to connect to a database. The database must exist.
$port = NULL; //Default must be NULL to use default port
$mysqli = new mysqli('127.0.0.1', $user, $password, $database, $port);

if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') '
            . $mysqli->connect_error);
}
echo '<p>Connection OK '. $mysqli->host_info.'</p>';
echo '<p>Server '.$mysqli->server_info.'</p>';
echo '<p>Initial charset: '.$mysqli->character_set_name().'</p>';
  
$link = mysqli_connect($host, $user, $password, $database);
#mysqli_set_charset("cp1251", $link);

$query ="SELECT * FROM tournumbers";
$query2 = "SELECT * FROM statistics WHERE Gameid = 1";

$result=mysqli_query($link, $query);

$result2=mysqli_query($link, $query2);

if($result)
{
    $rows = mysqli_num_rows($result); // количество полученных строк
    echo "<table><tr><th>Id</th><th>Дата начала</th><th>Дата конца</th></tr>";
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($result);
        echo "<tr>";
            for ($j = 0 ; $j < 3 ; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
    }
    echo "</table>";
     
    // очищаем результат
    mysqli_free_result($result);
}
if($result2)
{
    $rows = mysqli_num_rows($result2); // количество полученных строк
    echo "<table><tr><th>Id</th><th>PlayerId</th><th>Goals</th><th>Yellow card</th><th>Red Card</th><th>Assists</th><th>Game Id</th></tr>";
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($result2);
        echo "<tr>";
            for ($j = 0 ; $j < 7 ; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
    }
    echo "</table>";
     
    // очищаем результат
    mysqli_free_result($result2);
}
$mysqli->close();
?>
