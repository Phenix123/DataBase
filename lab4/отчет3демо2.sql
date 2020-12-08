SELECT 
    demo_cup.statistics.Goals,
    players.FIO,
    teams.Name
    #sum(demo_cup.statistics.Goals)
FROM
    statistics
        JOIN
    teamstoplayers on  teamstoplayers.PlayerId = statistics.PlayerId
		JOIN
    players on players.Id = statistics.PlayerId
		Join
	teams on teams.id = teamstoplayers.TeamId
WHERE
		demo_cup.statistics.GameId = 1
Order By Name;

