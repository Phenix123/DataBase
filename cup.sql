-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 28 2020 г., 10:21
-- Версия сервера: 5.7.31
-- Версия PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cup`
--

DELIMITER $$
--
-- Процедуры
--
DROP PROCEDURE IF EXISTS `ShowResultOfTheMatch`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowResultOfTheMatch` (IN `game_id` INT)  BEGIN
SELECT
stadions.Name AS 'Стадион',
referees.Name AS 'Судья',
TourNumberId,
team1.name,
team2.name,
DateOfMatch,
statistics.goals,
teamstoplayers.TeamId,
players.FIO
FROM
gamesbetweentwoteams
JOIN
statistics JOIN
teamstoplayers on statistics.PlayerId = teamstoplayers.PlayerId
JOIN
players on players.id = statistics.PlayerId
JOIN
referees ON referees.id = gamesbetweentwoteams.RefereeId
JOIN
stadions ON stadions.id = gamesbetweentwoteams.StadionId
JOIN
teams as team1 on team1.id = Team1Id
JOIN
teams as team2 on team2.id = Team2Id
WHERE
statistics.GameId = game_id
AND gamesbetweentwoteams.id = game_id;
END$$

DROP PROCEDURE IF EXISTS `ShowsPlayersTeams`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ShowsPlayersTeams` (`idOfTeam` INT)  BEGIN
SELECT 
    cup.players.FIO, cup.teamstoplayers.TeamId
FROM
    cup.players
        JOIN
    cup.teamstoplayers on cup.players.id = cup.teamstoplayers.PlayerId
    WHERE
    cup.teamstoplayers.TeamId = idOfTeam; 
                END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citiesIndex` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `Name`) VALUES
(1, 'Волгоград'),
(5, 'Казань'),
(10, 'Краснодар'),
(9, 'Мордовия'),
(2, 'Москва'),
(7, 'Нижний-Новгород'),
(8, 'Ростов'),
(6, 'Самара'),
(3, 'Санкт-Петербург'),
(4, 'Сочи');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `citiesstadions`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `citiesstadions`;
CREATE TABLE IF NOT EXISTS `citiesstadions` (
`Название города` varchar(255)
,`Name` varchar(255)
);

-- --------------------------------------------------------

--
-- Структура таблицы `coachs`
--

DROP TABLE IF EXISTS `coachs`;
CREATE TABLE IF NOT EXISTS `coachs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FIO` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `coachs`
--

INSERT INTO `coachs` (`id`, `FIO`, `Age`) VALUES
(1, 'Леонид Викторович Слуцкий', 47),
(2, 'Андреев Сергей Васильевич', 48),
(3, 'Балахнин Сергей Николаевич', 56),
(4, 'Бердыев Курбан Бекиевич', 50),
(5, 'Бородюк Александр Генрихович', 55),
(6, 'Гаджиев Гаджи Муслимович', 44),
(7, 'Газаеев Юрий Фарзунович', 62),
(8, 'Газзаев Валерий Георгиевич', 48),
(9, 'Семин Юрий Павлович', 48),
(10, 'Черчесов Станислав Саламович', 57),
(11, 'Самедов Александр Александрович', 39),
(12, 'Садырин Павел Аркадьевич', 54),
(13, 'Романцев Олен Сергеевич', 44),
(14, 'Игнатьев Борис Романович', 39),
(15, 'Ярцев Георгий Михайлович', 40),
(16, 'Трениз Арбра Матыгов', 32);

-- --------------------------------------------------------

--
-- Структура таблицы `gamesbetweentwoteams`
--

DROP TABLE IF EXISTS `gamesbetweentwoteams`;
CREATE TABLE IF NOT EXISTS `gamesbetweentwoteams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StadionId` int(11) NOT NULL,
  `RefereeId` int(11) NOT NULL,
  `TourNumberId` int(11) NOT NULL,
  `Team1Id` int(11) NOT NULL,
  `Team2Id` int(11) NOT NULL,
  `DateOfMatch` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `GamesBetweenTwoTeams_fk2` (`TourNumberId`),
  KEY `GamesBetweenTwoTeams_fk3` (`Team1Id`),
  KEY `GamesBetweenTwoTeams_fk4` (`Team2Id`),
  KEY `GamesBetweenTwoTeams_fk1_idx` (`RefereeId`),
  KEY `GamesBetweenTwoTeams_fk0_idx` (`StadionId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gamesbetweentwoteams`
--

INSERT INTO `gamesbetweentwoteams` (`id`, `StadionId`, `RefereeId`, `TourNumberId`, `Team1Id`, `Team2Id`, `DateOfMatch`) VALUES
(1, 1, 1, 1, 1, 2, '2020-09-01'),
(2, 3, 2, 1, 3, 4, '2020-09-01'),
(3, 5, 3, 1, 5, 10, '2020-09-03'),
(4, 2, 5, 1, 6, 7, '2020-09-03'),
(6, 2, 6, 2, 7, 8, '2020-10-01'),
(7, 2, 1, 2, 1, 10, '2020-10-01'),
(8, 3, 7, 2, 2, 9, '2020-10-01'),
(9, 4, 8, 2, 3, 8, '2020-10-01'),
(10, 5, 9, 3, 4, 7, '2020-11-01'),
(11, 6, 2, 3, 5, 6, '2020-11-01'),
(12, 7, 3, 3, 6, 4, '2020-11-01'),
(15, 9, 7, 3, 7, 3, '2020-11-01'),
(16, 10, 8, 4, 1, 9, '2020-12-01');

-- --------------------------------------------------------

--
-- Структура таблицы `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FIO` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `players`
--

INSERT INTO `players` (`id`, `FIO`, `Age`) VALUES
(1, 'Криштиано Роналду', 20),
(2, 'Иванов Иван Иванович', 20),
(3, 'Андрей Прокопенко', 18),
(4, 'Курляк Дмитрий Владимирович', 20),
(5, 'Иванов Дмитрий Иванович', 21),
(6, 'Супер Игрок Игроков', 35),
(12, 'Токарев Натан Натаныч', 21),
(13, 'Низок Сергей Григорьевич', 23),
(14, 'Мостовой Сергей Григорьевич', 23),
(15, 'Адамов  Роман Станиславович', 23),
(16, 'Акинфеев Игорь Владимирович', 23),
(17, 'Алдонин Евгений Валерьевич', 23),
(18, 'Анюков Александр Геннадьевич', 23),
(19, 'Аршавин Андрей Сергеевич', 23),
(20, 'Беляев Максим Александрович', 23),
(22, 'Романов Михаил Петрович', 20),
(42, 'Токарев Натан Натаныч', 20),
(43, 'Ток Натан Натаныч', 18),
(44, 'Романов Дмитрий Витальевич', 31);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `playerstatistics`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `playerstatistics`;
CREATE TABLE IF NOT EXISTS `playerstatistics` (
`FIO` varchar(255)
,`Goals` int(11)
,`YellowCard` int(11)
,`RedCard` int(11)
,`Assist` int(11)
);

-- --------------------------------------------------------

--
-- Структура таблицы `referees`
--

DROP TABLE IF EXISTS `referees`;
CREATE TABLE IF NOT EXISTS `referees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `YearsOfWork` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `referees`
--

INSERT INTO `referees` (`id`, `Name`, `Age`, `YearsOfWork`) VALUES
(1, 'Николаев Алексей Валерьевич', 43, '2003-02-20'),
(2, 'Кирилл Николаевич Левников', 36, '2013-05-06'),
(3, 'Юрий Валерьевич Баскаков', 49, '1996-09-01'),
(5, 'Иван Иванович Никикуч', 48, '1999-05-01'),
(6, 'Черкасов Иван Абрамович', 63, '1998-05-06'),
(7, 'Жирков Юрий Юрьевич', 43, '2019-06-10'),
(8, 'Крутам Остап Максимович', 47, '2019-06-10'),
(9, 'Бендер Петр Степанович', 48, '2018-06-10'),
(10, 'Павлюченко Степан Петрович', 49, '2017-06-10'),
(11, 'Дзюба Артем Натаныч', 33, '2016-06-10'),
(12, 'Бессильный Марк Юрьевич', 51, '2015-06-10');

-- --------------------------------------------------------

--
-- Структура таблицы `stadions`
--

DROP TABLE IF EXISTS `stadions`;
CREATE TABLE IF NOT EXISTS `stadions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `CityId` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name` (`Name`),
  KEY `Stadions_fk0` (`CityId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `stadions`
--

INSERT INTO `stadions` (`id`, `Name`, `CityId`, `Capacity`) VALUES
(1, 'Волгоград-Арена', 1, 45600),
(2, 'Лужники', 2, 81000),
(3, 'Газпром-Арена', 3, 67000),
(4, 'Фишт', 4, 41000),
(5, 'Казань Арена', 5, 46000),
(6, 'Самара Арена', 6, 45000),
(7, 'Нижний Новгород', 7, 45000),
(8, 'Ростов Арена', 8, 43500),
(9, 'Мордовия Арена', 9, 44000),
(10, 'Краснодар', 10, 35000),
(11, 'Анжи', 1, 7800),
(12, 'Амкал', 2, 12000),
(13, 'Олимпийский', 2, 30000),
(14, 'ЦСКА', 2, 25000),
(15, 'Динамо', 2, 29500),
(16, 'Торпедо', 2, 10000),
(17, 'Олимп', 2, 5000);

-- --------------------------------------------------------

--
-- Структура таблицы `statistics`
--

DROP TABLE IF EXISTS `statistics`;
CREATE TABLE IF NOT EXISTS `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerId` int(11) DEFAULT NULL,
  `Goals` int(11) DEFAULT NULL,
  `YellowCard` int(11) DEFAULT NULL,
  `RedCard` int(11) DEFAULT NULL,
  `Assist` int(11) DEFAULT NULL,
  `GameId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Statistics_fk0` (`PlayerId`),
  KEY `Statistics_fk1` (`GameId`),
  KEY `YellowCardIndex` (`YellowCard`),
  KEY `AssistIndex` (`Assist`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `statistics`
--

INSERT INTO `statistics` (`id`, `PlayerId`, `Goals`, `YellowCard`, `RedCard`, `Assist`, `GameId`) VALUES
(1, 1, 3, 3, 0, 5, 1),
(2, 2, 3, 2, 0, 17, 2),
(3, 3, 3, 44, 1, 2, 1),
(4, 2, 3, 0, 0, 0, 1),
(5, 1, 2, 1, 3, 2, 2),
(6, 5, 1, 0, 1, 1, 2),
(7, 6, 1, 0, 1, 1, 2),
(8, 12, 1, 0, 1, 1, 2),
(9, 13, 1, 0, 1, 1, 2),
(10, 14, 1, 0, 1, 1, 2),
(11, 15, 1, 0, 1, 1, 2),
(12, 16, 1, 0, 1, 1, 2),
(13, 17, 1, 0, 1, 1, 2),
(14, 18, 1, 0, 1, 1, 2),
(15, 19, 1, 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `StadionId` int(11) NOT NULL,
  `Win` int(11) DEFAULT NULL,
  `Draw` int(11) DEFAULT NULL,
  `Lose` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `StadionId` (`StadionId`),
  KEY `StadionIdIndex` (`StadionId`),
  KEY `WinIndex` (`Win`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teams`
--

INSERT INTO `teams` (`id`, `Name`, `StadionId`, `Win`, `Draw`, `Lose`) VALUES
(1, 'Ротор', 1, 1, 2, 5),
(2, 'ЦСКА', 2, 7, 0, 0),
(3, 'Зенит', 3, 6, 1, 0),
(4, 'Сочи', 4, 3, 3, 1),
(5, 'Рубин', 5, 2, 3, 2),
(6, 'Крылья-Советов', 6, 5, 1, 1),
(7, 'Волгарь', 7, 4, 2, 1),
(8, 'Ростов', 8, 3, 3, 2),
(9, 'Саранск', 9, 1, 2, 4),
(10, 'Краснодар', 10, 5, 0, 2),
(11, 'Амкал', 12, 3, 2, 3),
(12, 'Анжи', 11, 1, 1, 1),
(13, 'Архыз', 16, 1, 0, 5),
(14, 'Динамо', 13, 4, 2, 1),
(15, 'Химки', 14, 4, 1, 2),
(16, 'Спутник', 15, 2, 1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `teamstocoachs`
--

DROP TABLE IF EXISTS `teamstocoachs`;
CREATE TABLE IF NOT EXISTS `teamstocoachs` (
  `TeamId` int(11) NOT NULL,
  `CoachId` int(11) NOT NULL,
  `DateTimeFrom` date NOT NULL,
  `DataTimeTo` date NOT NULL,
  KEY `fk1_idx` (`CoachId`),
  KEY `TeamsToCoachs_fk1` (`TeamId`),
  KEY `DateTimeFromIndex` (`DateTimeFrom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teamstocoachs`
--

INSERT INTO `teamstocoachs` (`TeamId`, `CoachId`, `DateTimeFrom`, `DataTimeTo`) VALUES
(1, 1, '2020-08-01', '2024-08-01'),
(2, 2, '2018-04-17', '2021-04-17'),
(3, 3, '2019-05-11', '2022-10-11'),
(4, 4, '2017-09-01', '2025-09-10'),
(5, 5, '2017-09-01', '2025-09-10'),
(7, 7, '2017-09-01', '2025-09-10'),
(8, 8, '2017-09-01', '2025-09-10'),
(9, 9, '2017-09-01', '2025-09-10'),
(10, 10, '2017-09-01', '2025-09-10'),
(11, 11, '2017-09-01', '2025-09-10'),
(12, 12, '2017-09-01', '2022-10-11'),
(12, 12, '2017-09-01', '2022-10-11'),
(13, 16, '2017-09-01', '2022-10-11'),
(14, 16, '2017-09-01', '2022-10-11'),
(15, 16, '2017-09-01', '2022-10-11'),
(16, 16, '2017-09-01', '2022-10-11');

-- --------------------------------------------------------

--
-- Структура таблицы `teamstoplayers`
--

DROP TABLE IF EXISTS `teamstoplayers`;
CREATE TABLE IF NOT EXISTS `teamstoplayers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerId` int(11) NOT NULL,
  `TeamId` int(11) DEFAULT NULL,
  `DateTimeFrom` date NOT NULL,
  `DateTimeTo` date NOT NULL,
  `Position` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TeamsToPlayers_fk0` (`PlayerId`),
  KEY `TeamsToPlayers_fk1` (`TeamId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teamstoplayers`
--

INSERT INTO `teamstoplayers` (`id`, `PlayerId`, `TeamId`, `DateTimeFrom`, `DateTimeTo`, `Position`) VALUES
(1, 1, 1, '2018-09-01', '2021-09-01', 'ST'),
(2, 2, 1, '2017-09-01', '2020-12-01', 'RW'),
(3, 3, 2, '2005-09-01', '2025-09-10', 'CM'),
(4, 4, 2, '2017-09-01', '2020-09-11', 'GP'),
(5, 5, NULL, '2018-09-01', '2020-12-01', 'CAM'),
(9, 13, 2, '2013-09-01', '2022-09-10', 'CM'),
(10, 14, 3, '2012-09-01', '2020-09-10', 'CM'),
(11, 15, 4, '2015-09-01', '2018-09-10', 'CM'),
(12, 16, 5, '2011-09-01', '2014-09-10', 'CM'),
(13, 17, 6, '2016-09-01', '2024-09-10', 'CM'),
(14, 18, 7, '2018-09-01', '2019-09-10', 'CM'),
(15, 19, 8, '2011-09-01', '2012-09-10', 'CM'),
(22, 42, 2, '2020-12-12', '2020-12-12', 'RW'),
(23, 43, 1, '2020-12-12', '2020-12-12', 'RW'),
(24, 44, 1, '2020-12-12', '2020-12-12', 'RW');

-- --------------------------------------------------------

--
-- Структура таблицы `tournumbers`
--

DROP TABLE IF EXISTS `tournumbers`;
CREATE TABLE IF NOT EXISTS `tournumbers` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `DateTimeFrom` date NOT NULL,
  `DateTimeTo` date NOT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tournumbers`
--

INSERT INTO `tournumbers` (`Number`, `DateTimeFrom`, `DateTimeTo`) VALUES
(1, '2020-09-01', '2020-09-03'),
(2, '2020-09-07', '2020-09-10'),
(3, '2020-09-17', '2020-09-21'),
(4, '2020-10-01', '2020-10-01');

-- --------------------------------------------------------

--
-- Структура для представления `citiesstadions`
--
DROP TABLE IF EXISTS `citiesstadions`;

DROP VIEW IF EXISTS `citiesstadions`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `citiesstadions`  AS  select `cities`.`Name` AS `Название города`,`stadions`.`Name` AS `Name` from (`cities` join `stadions` on((`cities`.`id` = `stadions`.`CityId`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `playerstatistics`
--
DROP TABLE IF EXISTS `playerstatistics`;

DROP VIEW IF EXISTS `playerstatistics`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `playerstatistics`  AS  select `players`.`FIO` AS `FIO`,`statistics`.`Goals` AS `Goals`,`statistics`.`YellowCard` AS `YellowCard`,`statistics`.`RedCard` AS `RedCard`,`statistics`.`Assist` AS `Assist` from (`players` join `statistics` on((`statistics`.`PlayerId` = `players`.`id`))) ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gamesbetweentwoteams`
--
ALTER TABLE `gamesbetweentwoteams`
  ADD CONSTRAINT `GamesBetweenTwoTeams_fk0` FOREIGN KEY (`StadionId`) REFERENCES `stadions` (`id`),
  ADD CONSTRAINT `GamesBetweenTwoTeams_fk1` FOREIGN KEY (`RefereeId`) REFERENCES `referees` (`id`),
  ADD CONSTRAINT `GamesBetweenTwoTeams_fk2` FOREIGN KEY (`TourNumberId`) REFERENCES `tournumbers` (`Number`),
  ADD CONSTRAINT `GamesBetweenTwoTeams_fk3` FOREIGN KEY (`Team1Id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `GamesBetweenTwoTeams_fk4` FOREIGN KEY (`Team2Id`) REFERENCES `teams` (`id`);

--
-- Ограничения внешнего ключа таблицы `stadions`
--
ALTER TABLE `stadions`
  ADD CONSTRAINT `Stadions_fk0` FOREIGN KEY (`CityId`) REFERENCES `cities` (`id`);

--
-- Ограничения внешнего ключа таблицы `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `Statistics_fk0` FOREIGN KEY (`PlayerId`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `Statistics_fk1` FOREIGN KEY (`GameId`) REFERENCES `gamesbetweentwoteams` (`id`);

--
-- Ограничения внешнего ключа таблицы `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `Teams_fk0` FOREIGN KEY (`StadionId`) REFERENCES `stadions` (`id`);

--
-- Ограничения внешнего ключа таблицы `teamstocoachs`
--
ALTER TABLE `teamstocoachs`
  ADD CONSTRAINT `TeamsToCoachs_fk0` FOREIGN KEY (`CoachId`) REFERENCES `coachs` (`id`),
  ADD CONSTRAINT `TeamsToCoachs_fk1` FOREIGN KEY (`TeamId`) REFERENCES `teams` (`id`);

--
-- Ограничения внешнего ключа таблицы `teamstoplayers`
--
ALTER TABLE `teamstoplayers`
  ADD CONSTRAINT `TeamsToPlayers_fk0` FOREIGN KEY (`PlayerId`) REFERENCES `players` (`id`),
  ADD CONSTRAINT `TeamsToPlayers_fk1` FOREIGN KEY (`TeamId`) REFERENCES `teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
