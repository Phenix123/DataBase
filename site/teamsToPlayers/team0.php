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

    require '../Func/connector.php';

    $query = "SELECT players.Id, players.FIO, Age, teamstoplayers.TeamId FROM players JOIN teamstoplayers on players.id = teamstoplayers.PlayerId WHERE teamstoplayers.TeamId = 1";

    $result = mysqli_query($link, $query);

    if($result)
    {
        $rows = mysqli_num_rows($result); // количество полученных строк
        echo "<table><tr><th>Id</th><th>Фамилия</th><th>Возраст</th><th>Команда</th></tr>";
        for ($i = 0 ; $i < $rows ; ++$i)
        {
            $row = mysqli_fetch_row($result);
            echo "<tr>";
                for ($j = 0 ; $j < 4 ; ++$j)
                { 
                    echo "<td>$row[$j]</td>"; 
                }       
            echo "</tr>";
        }
        echo "</table></br>";
     
    // очищаем результат
        mysqli_free_result($result);
    }

?>

<html>
<form method="POST" id="data">
    
<?php
    $idQuery = "SELECT COUNT(*) from teamstoplayers where TeamId = 1";
    
    $idPlayer = "SELECT PlayerId from teamstoplayers where TeamId = 1";
    $result = mysqli_query($link, $idPlayer);
    $rows = mysqli_num_rows($result);
    echo '<p><select name = "ind">';
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($result);
        echo "<option value='$row[0]'>$row[0]</option>";
    }
    echo "</select></p>";
?>
    <p><input placeholder="ФИО" name="FIO" form="data"></p>
    <p><input placeholder="Возраст" name="Age" form="data"></p>
    <p><input placeholder="Номер команды" name="TeamId" form="data"></p>
    <p><input type="submit" name = "edit" value="Редактировать игрока" form="data"><br><br><br></p>
    </form>
</html>

<?php


    if (isset($_POST['edit']))
    {
        $ind = $_POST['ind'];  
        $name = htmlentities(mysqli_real_escape_string($link, $_POST['FIO']));
        $age = htmlentities(mysqli_real_escape_string($link, $_POST['Age']));
        $team = htmlentities(mysqli_real_escape_string($link, $_POST['TeamId']));
        $addQuery = "UPDATE players set FIO = '$name' where id = '$ind'";
        $result1 = mysqli_query($link, $addQuery);
        
        
        $addQuery = "UPDATE players set Age = '$age' where id = '$ind'";
        $result1 = mysqli_query($link, $addQuery);

        
        $addQuery = "UPDATE teamstoplayers set TeamId = '$team' where PlayerId = '$ind'";
        $result1 = mysqli_query($link, $addQuery);
    }
?>