<?php
/*
* Change the value of $password if you have set a password on the root userid
* Change NULL to port number to use DBMS other than the default using port 3306
*
*/
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

$select_teams_query ="SELECT * FROM teams";
$select_stat_query = "SELECT * FROM statistics WHERE Gameid = 1";
$procedure_query = "call ShowsPlayersTeams(2)";
$update_query = "UPDATE statistics SET goals = 3 WHERE GameId = 1";
$insert_query = "INSERT INTO teams (Name, StadionId, Win, Draw, Lose) values('Команда', '17', '3', '2','3')";
$delete_query = "DELETE from teams WHERE Name = 'Команда'";

$result4 = mysqli_query($link, $update_query);
$result5 = mysqli_query($link, $insert_query);
$result6 = mysqli_query($link, $delete_query);
$result  = mysqli_query($link, $select_teams_query );
$result2 = mysqli_query($link, $select_stat_query);
$result3 = mysqli_query($link, $procedure_query);


if($result6)
    printf("Удаление и добавление успешны");

if($result)
{
    $rows = mysqli_num_rows($result); // количество полученных строк
    echo "<table><tr><th>Id</th><th>Название команды</th></tr>";
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($result);
        echo "<tr>";
            for ($j = 0 ; $j < 2 ; ++$j) echo "<td>$row[$j]</td>";
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

if($result3)
{
    $rows = mysqli_num_rows($result3); // количество полученных строк
    echo "Показать игроков 2-ой команды";
    echo "<table><tr><th>FIO</th><th>TeamId</th></tr>";
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($result3);
        echo "<tr>";
            for ($j = 0 ; $j < 2 ; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
    }
    echo "</table>";
     
    // очищаем результат
    mysqli_free_result($result3);
}
$mysqli->close();
?>
