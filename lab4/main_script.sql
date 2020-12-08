## Добавить матч
##INSERT INTO demo_cup.gamesbetweentwoteams values(4,2,4,1,6,7,'2020-09-03');

## Добавить команду
##INSERT INTO demo_cup.teams (Name, StadionId, Win, Draw, Lose) values('Амкал', '11', '3', '2', '3');

##Добавить игрока
##INSERT INTO demo_cup.players (FIO, Age) values('Курляк Дмитрий Владимирович','20');

##Добавить тренера
##INSERT INTO demo_cup.coachs (FIO, Age) values('Самедов Александр Ахмедович',  '39');

##Добавить стадион
##INSERT INTO demo_cup.stadions (Name, CityId, Capacity) values('Карабах', '4', '3500');

##Добавить тур
##NSERT INTO demo_cup.tournumbers (DateTimeFrom, DateTimeTo) values('2020-10-01', '2020-10-07');

## Показать результат 1 встречи
##SELECT
##    demo_cup.statistics.Goals,
##    demo_cup.statistics.PlayerId,
##    demo_cup.players.FIO,
##    demo_cup.teamstoplayers.TeamId
##FROM
##    demo_cup.statistics
##        JOIN
##    demo_cup.teamstoplayers,
##    demo_cup.players
##WHERE
##    demo_cup.statistics.PlayerId = demo_cup.teamstoplayers.PlayerId
##        AND demo_cup.statistics.GameId = 1
##        AND demo_cup.statistics.PlayerId = demo_cup.players.Id;

##Показать трансферы турнира
##SELECT 
##    demo_cup.players.FIO, demo_cup.teamstoplayers.*
##FROM
##    demo_cup.players
##        JOIN
##    demo_cup.teamstoplayers
##WHERE
##    demo_cup.teamstoplayers.PlayerId = demo_cup.players.id;

## Вывести состав команды
##SELECT 
##   demo_cup.players.FIO, demo_cup.teamstoplayers.TeamId
##FROM
##  demo_cup.players
##       JOIN
##    demo_cup.teamstoplayers
##WHERE
##    demo_cup.teamstoplayers.TeamId = 1
##        AND demo_cup.players.id = demo_cup.teamstoplayers.PlayerId;

## Вывести информацию по матчу
#SELECT 
    #demo_cup.gamesbetweentwoteams.StadionId,
    #RefereeId,
    #TourNumberId,
    #Team1Id,
    #Team2Id,
    #DateOfMatch,
   # demo_cup.statistics.goals,
  #  demo_cup.teamstoplayers.TeamId,
 #   demo_cup.players.FIO
#FROM
    #demo_cup.gamesbetweentwoteams
     #   JOIN
    #demo_cup.statistics
    #    JOIN
   # demo_cup.teamstoplayers
  #      JOIN
 #   demo_cup.players
#WHERE
#   demo_cup.statistics.GameId = 1
#        AND demo_cup.gamesbetweentwoteams.id = 1
#        AND statistics.PlayerId = demo_cup.teamstoplayers.PlayerId
##        AND demo_cup.players.id = statistics.PlayerId;
        
##5.	Вывести статистику игрока в команде
#SELECT 
#    demo_cup.statistics.*
#FROM
#    demo_cup.statistics
#WHERE
#    PlayerId = 1;

# Показать итоговую статистику
#SELECT 
#    demo_cup.statistics.*
#FROM
#    demo_cup.statistics
#WHERE
#    PlayerId = 2;

##Показать таблицу турнира
#SELECT 
#    *
#FROM
#    demo_cup.teams
#ORDER BY win DESC , Draw DESC

## Пара на след. тур
#SELECT demo_cup.teams.Name as Pair_Team FROM demo_cup.teams ORDER BY rand() LIMIT 2;

#Показать стадион и соответсвующие города
#SELECT 
#    demo_cup.cities.Name, demo_cup.stadions.Name
#FROM
#    demo_cup.cities
#        JOIN
#    demo_cup.stadions
#WHERE
#    demo_cup.stadions.CityId = demo_cup.cities.id;

##Update+Where
#update demo_cup.stadions set capacity = 35000 where Name = 'Карабах';
#update demo_cup.statistics set goals = 3 where PlayerId = 3;
#update demo_cup.referees set Age = 49 where id = 3;
#update demo_cup.stadions set Capacity = 9000 where id = 11;
#update demo_cup.players set Age = 31 where id = 2;
#update demo_cup.teams set Win = 1 where Name = 'Ротор';
#update demo_cup.coachs set Age = 47 where id = 1;
#update demo_cup.stadions set CityId = 2 where id = 12;

##Delete + Where
#DELETE FROM demo_cup.stadions WHERE NAME = 'Карабах';
#DELETE FROM demo_cup.stadions WHERE id = 11;
#DELETE FROM demo_cup.referees WHERE id = 4;
#DELETE FROM demo_cup.coachs WHERE id = 11;
#DELETE FROM demo_cup.tournumbers WHERE Number = 5;


##SELECT, DISTINCT, WHERE, AND/OR/NOT, IN, BETWEEN, IS NULL, AS (25)
#SELECT * from demo_cup.players where AGE < 30;
#SELECT FIO from demo_cup.players;
#SELECT * from demo_cup.teams where WIN > 3;
#SELECT * from demo_cup.statistics where Goals > 2;
#SELECT * from demo_cup.coachs where AGE between 50 and 60;
#SELECT Name as 'ФИО' from demo_cup.referees;
#SELECT * from demo_cup.teamstoplayers where TeamId is not null;
#SELECT Name as "Название" from demo_cup.cities; 
#SELECT FIO, AGE FROM demo_cup.players where age <> 18 and age < 21;
#SELECT sum(goals) as "Забитых голов игроком 1" from demo_cup.statistics where PlayerId = 1;
#SELECT distinct age as "Различные возраста" from demo_cup.coachs; 
#SELECT Name from demo_cup.stadions where CityId IN (2,3);
#SELECT FIO, AGE from demo_cup.players where Age = 20 or Age = 21 or Age = 18;
#SELECT tournumbers.DateTimeFrom as "Дата начала тура", tournumbers.DateTimeFrom as "Дата конца тура" from demo_cup.tournumbers;
#SELECT PlayerId as "Свободные игроки" from demo_cup.teamstoplayers where TeamId is NULL;
#SELECT sum(goals) as "Общее количество забитых голов" from demo_cup.statistics;
#SELECT distinct age as "Различные возраста" from demo_cup.referees; 
#SELECT PlayerId as "Занятые игроки" from demo_cup.teamstoplayers where TeamId is NOT NULL;
#SELECT COUNT(*) from demo_cup.tournumbers;
#SELECT COUNT(*) as "Количество стадионов Москвы"from demo_cup.stadions where CityId = 2;

##LIKE
#SELECT FIO from demo_cup.players where FIO like '%Дмитрий%';
#SELECT FIO from demo_cup.coachs where FIO like '%Сергей%';
#SELECT Name from demo_cup.cities where Name like 'С%';
#SELECT Name from demo_cup.teams where Name like '%ь%';
#SELECT FIO from demo_cup.players where FIO like '% % %';

##COUNT, MAX, MIN, SUM, AVG (10 шт.)
#SELECT COUNT(*) from demo_cup.tournumbers;
#SELECT COUNT(*) as "Количество стадионов Москвы"from demo_cup.stadions where CityId = 2;
#SELECT AVG(AGE) from demo_cup.coachs;
#SELECT AVG(AGE) from demo_cup.players;
#SELECT AVG(AGE) from demo_cup.referees;
#SELECT sum(goals) as "Забитых голов игроком 1" from demo_cup.statistics where PlayerId = 1;
#SELECT MAX(Goals) from demo_cup.statistics;
#SELECT MAX(Age) from demo_cup.coachs;
#SELECT MIN(Age) from demo_cup.players;

##GROUP BY, HAVING (7 шт. +)
#SELECT 
#    demo_cup.statistics.goals,
#    Count(PlayerId)
#FROM
#	demo_cup.statistics
#        JOIN
#    demo_cup.players
#WHERE
#    demo_cup.players.id = demo_cup.statistics.PlayerId
#GROUP BY goals;

#SELECT 
#   demo_cup.cities.Name,
#    COUNT(demo_cup.stadions.CityId) as "Количество стадионов"
#FROM
#    demo_cup.stadions
#        JOIN
#    demo_cup.cities
#WHERE
#    demo_cup.stadions.CityId = demo_cup.cities.id
#GROUP BY demo_cup.cities.Name;

#SELECT 
#   miN(demo_cup.players.age),
#    max(demo_cup.players.age)
#FROM
#    demo_cup.players
#HAVING AVG(age) > 20;

#SELECT
#	demo_cup.players.FIO,
#	demo_cup.statistics.goals
#   from
#    demo_cup.statistics
#   JOIN
#  demo_cup.players
#   where
#   demo_Cup.players.id = demo_cup.statistics.PlayerId
#   Group by demo_cup.statistics.PlayerId;

#SELECTv
#	demo_cup.gamesbetweentwoteams.TourNumberId,
#   COUNT(TourNumberId) as "Количество матчей сыгранных в туре"
#FROM
#    demo_cup.gamesbetweentwoteams
#GROUP BY TourNumberId;

##ORDER BY
#SELECT
#	demo_cup.players.FIO, AGE
#from
#	demo_cup.players
#ORDER BY 	demo_cup.players.age;

#SELECT 
#    demo_cup.statistics.goals, COUNT(PlayerId)
#FROM
#    demo_cup.statistics
#        JOIN
#    demo_cup.players
#WHERE
#    demo_cup.players.id = demo_cup.statistics.PlayerId
#GROUP BY goals
#ORDER BY GOALS;

#SELECT 
#    demo_cup.cities.Name, demo_cup.stadions.Name
#FROM
#    demo_cup.cities
#        JOIN
#    demo_cup.stadions
#WHERE
#    demo_cup.stadions.CityId = demo_cup.cities.id
#ORDER BY demo_cup.cities.NAME;

#SELECT FIO
#FROM demo_cup.players
#WHERE AGE = (select MIN(AGE) FROM demo_cup.players);

#SELECT 
#    Name
#FROM
#    demo_cup.referees
#WHERE
#    YearsOfWork = (SELECT 
#            MIN(demo_cup.referees.YearsOfWork)
#        FROM
#            demo_cup.referees);

##INSERT INTO
#INSERT INTO
#    players
#SELECT *
# FROM coachs
# WHERE age < 40;

##
#SELECT players.FIO, AGE
#From players
#UNION
#SELECT coachs.FIO, AGE
#From coachs
#order by AGE;

#SELECT players.FIO,
#sum(statistics.goals)
#from players
#join
#statistics
#where
#goals > 0
#and
#players.id = statistics.PlayerId
#GROUP BY statistics.PlayerId
#LIMIT 2;

#SELECT FIO from demo_cup.players where FIO like '% % %' limit 3;

#SELECT 
#    demo_cup.statistics.goals, COUNT(PlayerId)
#FROM
#    demo_cup.statistics
#        JOIN
#    demo_cup.players
#WHERE
#    demo_cup.players.id = demo_cup.statistics.PlayerId
#GROUP BY goals
#ORDER BY GOALS
#limit 1;
#USE demo_cup;

SELECT *
FROM players FULL JOIN coachs
ON players.id = coachs.id
    
