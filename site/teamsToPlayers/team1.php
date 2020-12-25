<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tournament</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>

<h1>My Cup Table</h1>

<a href="../resultOfMatches">Вернуться</a>

<script src="./script.js"></script>
</body>
</html>

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
    
    mysqli_set_charset($link, "utf8"); // change charset to utf-8echo "Hello"

    $query = "SELECT players.FIO, Age, teamstoplayers.TeamId FROM players JOIN teamstoplayers on players.id = teamstoplayers.PlayerId WHERE teamstoplayers.TeamId = 2";

    $result = mysqli_query($link, $query);

    if($result)
    {
    $rows = mysqli_num_rows($result); // количество полученных строк
    echo "<table><tr><th>Фамилия</th><th>Возраст</th><th>Команда</th></tr>";
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($result);
        echo "<tr>";
            for ($j = 0 ; $j < 3 ; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
    }
    echo "</table></br>";
     
    // очищаем результат
    mysqli_free_result($result);
    }

?>