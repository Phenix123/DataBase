Create index AssistIndex on statistics (assist);
SELECT 
    *
FROM
    statistics
        RIGHT JOIN
    players ON statistics.PlayerId = players.id
where assist > 3;
