DELIMITER $$
CREATE FUNCTION PlayersWithTeam (TeamId int)
Returns boolean DETERMINISTIC
BEGIN
	declare a boolean;
	if TeamId is null then
		set a = false;
	else
		set a = true;
         END IF;  
	return (a);
END;
$$
DELIMITER ;

SELECT 
    players.FIO, PLAYERSWITHTEAM(teamstoplayers.TeamId) as "Есть команда"
FROM
    teamstoplayers
        JOIN
    players ON players.id = teamstoplayers.PlayerId;