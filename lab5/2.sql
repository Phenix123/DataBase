Create index DateTimeFromIndex on teamstocoachs (DateTimeFrom);
SELECT 
    FIO, DateTimeFrom, DataTimeTo
FROM
    coachs
        JOIN
    teamstocoachs ON teamstocoachs.CoachId = coachs.id 
WHERE
    teamstocoachs.DateTimeFrom > '2018-01-01';