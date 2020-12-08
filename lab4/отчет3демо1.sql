use demo_cup;
SELECT 
    stadions.Name AS 'Стадион',
    referees.Name AS 'Судья',
    team1.Name AS 'Команда 2',
    team2.Name AS 'Команда 1',
    goals1.goals AS '',
    goals2.goals AS ''
FROM
    gamesbetweentwoteams
        JOIN
    statistics ON gamesbetweentwoteams.id = GameId
        INNER JOIN
    teams AS team1 ON team1.id = gamesbetweentwoteams.Team1Id
        INNER JOIN
    teams AS team2 ON team2.id = gamesbetweentwoteams.Team2Id
        JOIN
    referees ON referees.id = gamesbetweentwoteams.RefereeId
        JOIN
    stadions ON stadions.id = gamesbetweentwoteams.StadionId
        JOIN
    statistics AS goals1 ON gamesbetweentwoteams.id = goals1.GameId
        JOIN
    statistics AS goals2 ON gamesbetweentwoteams.id = goals2.GameId
        JOIN
    teamstoplayers ON teamstoplayers.PlayerId = goals1.PlayerId
		JOIN
   players on statistics.PlayerId = players.Id
WHERE
    gamesbetweentwoteams.TourNumberId = 1
        AND statistics.GameId = 1
        AND statistics.PlayerId = teamstoplayers.PlayerId;