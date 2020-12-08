CREATE VIEW CitiesStadions AS
    SELECT 
    cities.Name as 'Название города', stadions.Name
FROM
    cities 
        JOIN
    stadions on cities.id = stadions.CityId;
Select * from CitiesStadions;