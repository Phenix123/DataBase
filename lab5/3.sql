Create index WinIndex on teams (Win);
SELECT 
    COUNT(*) AS 'Количество стадионов Москвы', teams.Name
FROM
    stadions
JOIN 
    teams
    on teams.StadionId = stadions.id
WHERE
    Win between 2 and 5; 