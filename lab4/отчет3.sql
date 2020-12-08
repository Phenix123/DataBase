SELECT 
	stadions.Name AS 'Стадион',
    referees.Name AS 'Судья',
    TourNumberId,
    team1.name,
    team2.name,
    DateOfMatch,
    statistics.goals,
    teamstoplayers.TeamId,
    players.FIO
FROM
    gamesbetweentwoteams
        JOIN
    statistics
        JOIN
    teamstoplayers on statistics.PlayerId = teamstoplayers.PlayerId
        JOIN
    players on players.id = statistics.PlayerId
		JOIN
    referees ON referees.id = gamesbetweentwoteams.RefereeId
        JOIN
    stadions ON stadions.id = gamesbetweentwoteams.StadionId
		JOIN
	teams as team1 on team1.id = Team1Id
		JOIN
	teams as team2 on team2.id = Team2Id
WHERE
    statistics.GameId = 1
        AND gamesbetweentwoteams.id = 1;