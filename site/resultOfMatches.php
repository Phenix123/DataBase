<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tournament</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<h1>My Cup Table</h1>

<a href="statistics">Статистика</a>
<a href="match">Встречи</a>


<script src="./script.js"></script>
</body>

<?php
    require './Func/connector.php';
    

    $query = "SELECT Name, Win, Draw, Lose FROM teams ORDER BY win DESC , Draw DESC";
    $result = mysqli_query($link, $query);
    
    if($result)
    {
        $rows = mysqli_num_rows($result); // количество полученных строк
        echo "<table><tr><th>Команда</th><th>Победы</th><th>Ничьи</th><th>Поражения</th></tr>";
        for ($i = 0 ; $i < $rows ; ++$i)
        {
            $row = mysqli_fetch_row($result);
            echo "<tr>";
                for ($j = 0 ; $j < 4 ; ++$j) echo "<td><a href = './teamstoPlayers/team$i'>$row[$j]</a></td>";
            echo "</tr>";
        }
        echo "</table></br>";
        
        // очищаем результат
        mysqli_free_result($result);
    }

    if (isset($_POST['submit']))
    {
        $name = htmlentities(mysqli_real_escape_string($link, $_POST['FIO']));
        $age = htmlentities(mysqli_real_escape_string($link, $_POST['Age']));
        $to = htmlentities(mysqli_real_escape_string($link, $_POST['DateTo']));
        $from = htmlentities(mysqli_real_escape_string($link, $_POST['DateFrom']));
        $team = htmlentities(mysqli_real_escape_string($link, $_POST['TeamId']));
        $pos = htmlentities(mysqli_real_escape_string($link, $_POST['Position']));
        
        $addQuery = "INSERT INTO players (FIO, Age) values('$name', '$age')";
        $result1 = mysqli_query($link, $addQuery);
        $id = mysqli_insert_id($link);
        $addplayerToTeam = "INSERT INTO teamstoplayers (PlayerId, TeamId, DateTimeFrom, DateTimeTo, Position) values ('$id','$team','$from','$to','$pos')";
        $result2 = mysqli_query($link, $addplayerToTeam);
    }

    if (isset($_POST['delete']))
    {
        $name = htmlentities(mysqli_real_escape_string($link, $_POST['FIODEL']));

        $idQuery = "SELECT id FROM players where FIO = '$name'";
        $result3 = mysqli_query($link, $idQuery);

        $id0 = mysqli_fetch_row($result3);

        $deleteplayerFromTeam = "DELETE FROM teamstoplayers where PlayerId = '$id0[0]'";
        $result4 = mysqli_query($link, $deleteplayerFromTeam);
        $deletePlayer = "DELETE FROM players where FIO = '$name'";
        $result5 = mysqli_query($link, $deletePlayer);
    }

    $mysqli->close();
?>

<form method="POST" id="data"></form>
    <p><input placeholder="ФИО" name="FIO" form="data"></p>
    <p><input placeholder="Возраст" name="Age" form="data"></p>
    <p><input placeholder="Дата перехода" name="DateFrom" form="data"></p>
    <p><input placeholder="Конец контракта" name="DateTo" form="data"></p>
    <p><input placeholder="Номер команды" name="TeamId" form="data"></p>
    <p><input placeholder="Позиция" name="Position" form="data"></p>
    <p><input type="submit" name = "submit" value="Добавить игрока" form="data"><br><br><br></p>
    
<form method="POST" id="data"></form>
    <p><input placeholder="ФИО игрока, которого хотите удалить" name="FIODEL" form="data"></p>
    <p><input type="submit" name = "delete" value="Удалить игрока" form="data"><br><br><br></p>

</html>