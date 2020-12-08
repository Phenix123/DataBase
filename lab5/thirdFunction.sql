DELIMITER $$
CREATE FUNCTION TourView (Number int)
  RETURNS varchar(45)
  DETERMINISTIC
BEGIN
	declare a varchar(45);
	case
		when Number = 1 then set a = "Первый тур 04/09/2020 - 07/09/2020";
        when Number = 2 then set a = "Второй тур 11/09/2020 - 14/09/2020";
        when Number = 3 then set a = "Третий тур 17/09/2020 - 20/09/2020";
        when Number = 4 then set a = "Четвертый тур 24/09/2020 - 27/09/2020";
	end case;
    return (a);
END;
$$
DELIMITER ;

SELECT 
    COUNT(gamesbetweentwoteams.TourNumberId),
    TOURVIEW(tournumbers.Number)
FROM
    tournumbers
        JOIN
    gamesbetweentwoteams ON gamesbetweentwoteams.TourNumberId = tournumbers.Number
WHERE
    gamesbetweentwoteams.TourNumberId = 1;