CREATE VIEW PlayerStatistics AS
    SELECT 
        FIO, Goals, YellowCard, RedCard, Assist
    FROM
        players
            JOIN
        statistics ON statistics.PlayerId = players.id;

Select * from PlayerStatistics;