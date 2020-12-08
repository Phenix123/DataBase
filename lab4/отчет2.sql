use demo_cup;
SELECT 
    FIO, MAX(YellowCard + RedCard) as "Количество карточек", YellowCard, RedCard
FROM
    players
        JOIN
    statistics ON statistics.PlayerId = players.id
        where YellowCard + RedCard = (select MAX(YellowCard + RedCard) from statistics)