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



<a href="resultOfMatches">Показать таблицу</a>

<script src="./script.js"></script>
</body>
</html>
<?php
require './Func/connector.php';

$query = "call ShowResultOfTheMatch(1)";

$res = mysqli_query($link, $query);

if($res)
{
    $rows = mysqli_num_rows($res); // количество полученных строк
    echo "<table><tr><th>Стадион</th><th>Судья</th><th>Тур</th><th>Команда 1</th><th>Команда 2</th><th>Дата матча</th><th>Голы</th><th>За какую команду</th><th>ФИО</th></tr>";
    for ($i = 0 ; $i < $rows ; ++$i)
    {
        $row = mysqli_fetch_row($res);
        echo "<tr>";
            for ($j = 0 ; $j < 9 ; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
    }
    echo "</table></br>";
     
    // очищаем результат
    mysqli_free_result($res);
}

$mysqli->close();