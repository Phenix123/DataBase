SELECT 
    FIO,
    position,
    teamId,
    MAX(DATEDIFF(DateTimeTo, DateTimeFrom)) AS 'Количество дней' 
FROM
    players
        JOIN
    teamstoplayers on teamstoplayers.PlayerId = players.id
WHERE
    teamstoplayers.PlayerId = 1
        AND DATEDIFF(DateTimeTo, DateTimeFrom) = (SELECT 
            MAX(DATEDIFF(DateTimeTo, DateTimeFrom))
        FROM
            teamstoplayers
        WHERE
            teamstoplayers.PlayerId = 1);
    
