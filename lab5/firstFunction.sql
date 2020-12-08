DELIMITER $$
CREATE FUNCTION CountOfCard (yellow int, red int)
Returns int DETERMINISTIC
BEGIN 
	return yellow + red;
END;
$$
DELIMITER ;

SELECT 
    players.FIO, CountOfCard(statistics.YellowCard , statistics.RedCard) as 'Количетство карточек'
FROM
    statistics
        JOIN
    players ON players.id = statistics.PlayerId;