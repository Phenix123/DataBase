DELIMITER $$
CREATE PROCEDURE ShowsPlayersTeams(idOfTeam int)
BEGIN
SELECT 
    demo_cup.players.FIO, demo_cup.teamstoplayers.TeamId
FROM
    demo_cup.players
        JOIN
    demo_cup.teamstoplayers on demo_cup.players.id = demo_cup.teamstoplayers.PlayerId
    WHERE
    demo_cup.teamstoplayers.TeamId = idOfTeam; 
                END$$
DELIMITER ;

call ShowsPlayersTeams(2);