Create index YellowCardIndex on statistics (YellowCard);
SELECT 
    FIO, MAX(YellowCard) as "Максимальное количество количество карточек"
FROM
    players
        JOIN
    statistics ON statistics.PlayerId = players.id
        where YellowCard = (select MAX(YellowCard) from statistics)