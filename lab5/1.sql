#Create index stadionCapacityIndex on stadions (Capacity);
SELECT 
    demo_cup.cities.Name, demo_cup.stadions.Name
FROM
    demo_cup.cities
        JOIN 
    demo_cup.stadions on demo_cup.stadions.CityId = demo_cup.cities.id
    
    where stadions.Capacity < 45000;
