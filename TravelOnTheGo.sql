CREATE database IF NOT EXISTS TravelOnTheGo;
USE TravelOnTheGo;

-- 1) You are required to create two tables PASSENGER and PRICE with the following attributes and properties  
CREATE TABLE IF NOT EXISTS PASSENGER (
    Passenger_name VARCHAR(50),
    Category VARCHAR(10),
    Gender VARCHAR(1),
    Boarding_City VARCHAR(30),
    Destination_City VARCHAR(30),
    Distance INT,
    Bus_Type VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS PRICE (
    Bus_Type VARCHAR(10),
    Distance INT,
    Price INT
);


-- 2) Insert the following data in the tables
-- INSERTING VALUES IN PASSENGER TABLE
INSERT INTO PASSENGER VALUES ("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
INSERT INTO PASSENGER VALUES ("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
INSERT INTO PASSENGER VALUES ("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
INSERT INTO PASSENGER VALUES ("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
INSERT INTO PASSENGER VALUES ("Udit","Non-AC","M","Trivandrum","panaji",1000,"Sleeper");
INSERT INTO PASSENGER VALUES ("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
INSERT INTO PASSENGER VALUES ("Hemant","Non-AC","M","panaji","Mumbai",700,"Sleeper");
INSERT INTO PASSENGER VALUES ("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
INSERT INTO PASSENGER VALUES ("Piyush","AC",  "M","Pune","Nagpur",700,"Sitting");

-- INSERTING VALUES IN PRICE TABLE
INSERT INTO PRICE VALUES("Sleeper",350,770);
INSERT INTO PRICE VALUES("Sleeper",500,1100);
INSERT INTO PRICE VALUES("Sleeper",600,1320);
INSERT INTO PRICE VALUES("Sleeper",700,1540);
INSERT INTO PRICE VALUES("Sleeper",1000,2200);
INSERT INTO PRICE VALUES("Sleeper",1200,2640);
INSERT INTO PRICE VALUES("Sleeper",1500,2700);
INSERT INTO PRICE VALUES("Sitting",500,620);
INSERT INTO PRICE VALUES("Sitting",600,744);
INSERT INTO PRICE VALUES("Sitting",700,868);
INSERT INTO PRICE VALUES("Sitting",1000,1240);
INSERT INTO PRICE VALUES("Sitting",1200,1488);
INSERT INTO PRICE VALUES("Sitting",1500,1860);

-- 										Passenger Table
--  									---------------
-- +----------------+----------+--------+---------------+------------------+----------+----------+
-- | Passenger_name | Category | Gender | Boarding_City | Destination_City | Distance | Bus_Type |
-- +----------------+----------+--------+---------------+------------------+----------+----------+
-- | Sejal          | AC       | F      | Bengaluru     | Chennai          |      350 | Sleeper  |
-- | Anmol          | Non-AC   | M      | Mumbai        | Hyderabad        |      700 | Sitting  |
-- | Pallavi        | AC       | F      | Panaji        | Bengaluru        |      600 | Sleeper  |
-- | Khusboo        | AC       | F      | Chennai       | Mumbai           |     1500 | Sleeper  |
-- | Udit           | Non-AC   | M      | Trivandrum    | panaji           |     1000 | Sleeper  |
-- | Ankur          | AC       | M      | Nagpur        | Hyderabad        |      500 | Sitting  |
-- | Hemant         | Non-AC   | M      | panaji        | Mumbai           |      700 | Sleeper  |
-- | Manish         | Non-AC   | M      | Hyderabad     | Bengaluru        |      500 | Sitting  |
-- | Piyush         | AC       | M      | Pune          | Nagpur           |      700 | Sitting  |
-- +----------------+----------+--------+---------------+------------------+----------+----------+

-- 				Price
-- 				-----
-- +----------+----------+-------+
-- | Bus_Type | Distance | Price |
-- +----------+----------+-------+
-- | Sleeper  |      350 |   770 |
-- | Sleeper  |      500 |  1100 |
-- | Sleeper  |      600 |  1320 |
-- | Sleeper  |      700 |  1540 |
-- | Sleeper  |     1000 |  2200 |
-- | Sleeper  |     1200 |  2640 |
-- | Sleeper  |     1500 |  2700 |
-- | Sitting  |      500 |   620 |
-- | Sitting  |      600 |   744 |
-- | Sitting  |      700 |   868 |
-- | Sitting  |     1000 |  1240 |
-- | Sitting  |     1200 |  1488 |
-- | Sitting  |     1500 |  1860 |
-- +----------+----------+-------+



-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KMs?
SELECT 
    Gender, COUNT(*) AS 'Count'
FROM
    passenger
WHERE
    Distance >= 600
GROUP BY Gender;

-- 		OUTPUT
-- 		======
-- +--------+-------+
-- | Gender | Count |
-- +--------+-------+
-- | M      |     4 |
-- | F      |     2 |
-- +--------+-------+


-- 4) Find the minimum ticket price for Sleeper Bus.  
SELECT 
    MIN(Price) AS 'Minimum Ticket Price for Sleeper Bus'
FROM
    price
WHERE
    Bus_Type = 'Sleeper';
-- 				OUTPUT
-- 				======
-- +--------------------------------------+
-- | Minimum Ticket Price for Sleeper Bus |
-- +--------------------------------------+
-- |                                  770 |
-- +--------------------------------------+


-- 5) Select passenger names whose names start with character 'S' 
SELECT 
    Passenger_name AS 'Passenger Name'
FROM
    passenger
WHERE
    Passenger_name LIKE 'S%';
-- 		OUTPUT
-- 		======
-- +----------------+
-- | Passenger Name |
-- +----------------+
-- | Sejal          |
-- +----------------+


-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output 
-- IMPLICIT JOIN 
SELECT 
    RIDER.Passenger_name AS 'Passenger Name',
    RIDER.Boarding_City AS 'Boarding City',
    RIDER.Destination_City AS 'Destination City',
    RIDER.Bus_Type AS 'Bus Type',
    COST.Price
FROM
    passenger RIDER,
    price COST
WHERE
    RIDER.Bus_Type = COST.Bus_Type
        AND RIDER.Distance = COST.Distance;
-- 								OUTPUT
-- 								======
-- +----------------+---------------+------------------+----------+-------+
-- | Passenger Name | Boarding City | Destination City | Bus Type | Price |
-- +----------------+---------------+------------------+----------+-------+
-- | Sejal          | Bengaluru     | Chennai          | Sleeper  |   770 |
-- | Pallavi        | Panaji        | Bengaluru        | Sleeper  |  1320 |
-- | Hemant         | panaji        | Mumbai           | Sleeper  |  1540 |
-- | Udit           | Trivandrum    | panaji           | Sleeper  |  2200 |
-- | Khusboo        | Chennai       | Mumbai           | Sleeper  |  2700 |
-- | Manish         | Hyderabad     | Bengaluru        | Sitting  |   620 |
-- | Ankur          | Nagpur        | Hyderabad        | Sitting  |   620 |
-- | Piyush         | Pune          | Nagpur           | Sitting  |   868 |
-- | Anmol          | Mumbai        | Hyderabad        | Sitting  |   868 |
-- +----------------+---------------+------------------+----------+-------+

-- INNER JOIN USING ON CLAUSE
SELECT 
    RIDER.Passenger_name AS 'Passenger Name',
    RIDER.Boarding_City AS 'Boarding City',
    RIDER.Destination_City AS 'Destination City',
    RIDER.Bus_Type AS 'Bus Type',
    COST.Price
FROM
    passenger RIDER
        INNER JOIN
    price COST ON RIDER.Bus_Type = COST.Bus_Type
        AND RIDER.Distance = COST.Distance;
-- 								OUTPUT
-- 								======
-- +----------------+---------------+------------------+----------+-------+
-- | Passenger Name | Boarding City | Destination City | Bus Type | Price |
-- +----------------+---------------+------------------+----------+-------+
-- | Sejal          | Bengaluru     | Chennai          | Sleeper  |   770 |
-- | Pallavi        | Panaji        | Bengaluru        | Sleeper  |  1320 |
-- | Hemant         | panaji        | Mumbai           | Sleeper  |  1540 |
-- | Udit           | Trivandrum    | panaji           | Sleeper  |  2200 |
-- | Khusboo        | Chennai       | Mumbai           | Sleeper  |  2700 |
-- | Manish         | Hyderabad     | Bengaluru        | Sitting  |   620 |
-- | Ankur          | Nagpur        | Hyderabad        | Sitting  |   620 |
-- | Piyush         | Pune          | Nagpur           | Sitting  |   868 |
-- | Anmol          | Mumbai        | Hyderabad        | Sitting  |   868 |
-- +----------------+---------------+------------------+----------+-------+

-- INNER JOIN USING 'USING' CLAUSE
SELECT 
    RIDER.Passenger_name AS 'Passenger Name',
    RIDER.Boarding_City AS 'Boarding City',
    RIDER.Destination_City AS 'Destination City',
    RIDER.Bus_Type AS 'Bus Type',
    COST.Price
FROM
    passenger RIDER
        INNER JOIN
    price COST USING(Bus_Type, Distance);
-- 								OUTPUT
-- 								======
-- +----------------+---------------+------------------+----------+-------+
-- | Passenger Name | Boarding City | Destination City | Bus Type | Price |
-- +----------------+---------------+------------------+----------+-------+
-- | Sejal          | Bengaluru     | Chennai          | Sleeper  |   770 |
-- | Pallavi        | Panaji        | Bengaluru        | Sleeper  |  1320 |
-- | Hemant         | panaji        | Mumbai           | Sleeper  |  1540 |
-- | Udit           | Trivandrum    | panaji           | Sleeper  |  2200 |
-- | Khusboo        | Chennai       | Mumbai           | Sleeper  |  2700 |
-- | Manish         | Hyderabad     | Bengaluru        | Sitting  |   620 |
-- | Ankur          | Nagpur        | Hyderabad        | Sitting  |   620 |
-- | Piyush         | Pune          | Nagpur           | Sitting  |   868 |
-- | Anmol          | Mumbai        | Hyderabad        | Sitting  |   868 |
-- +----------------+---------------+------------------+----------+-------+


-- 7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 1000 KMs
SELECT 
    RIDER.Passenger_name,
    COST.Price
FROM
    passenger RIDER
        INNER JOIN
    price COST USING(Bus_Type, Distance) WHERE Distance = 1000 AND Bus_Type = 'Sitting'; 
-- 		OUTPUT
-- 		======
-- Empty set

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
  -- USING CITIES
SELECT 
    RIDER.Passenger_name AS 'Passenger Name',
    RIDER.Destination_City AS 'Boarding City',
    RIDER.Boarding_City AS 'Destination City',
    RIDER.Distance,
    COST.Bus_Type AS 'Bus Type',
    COST.Price
FROM
    passenger RIDER
        INNER JOIN
    price COST ON RIDER.Distance = COST.Distance
WHERE
    (RIDER.Boarding_City = 'Panaji'
        AND RIDER.Destination_City = 'Bengaluru')
        OR (RIDER.Boarding_City = 'Bengaluru'
        AND RIDER.Destination_City = 'Panaji');
-- 										OUTPUT
-- 										======
-- +----------------+---------------+------------------+----------+----------+-------+
-- | Passenger Name | Boarding City | Destination City | Distance | Bus Type | Price |
-- +----------------+---------------+------------------+----------+----------+-------+
-- | Pallavi        | Bengaluru     | Panaji           |      600 | Sleeper  |  1320 |
-- | Pallavi        | Bengaluru     | Panaji           |      600 | Sitting  |   744 |
-- +----------------+---------------+------------------+----------+----------+-------+



-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order
SELECT DISTINCT
    Distance
FROM
    passenger
ORDER BY Distance DESC;
-- 	  OUTPUT
--    ======
-- +----------+
-- | Distance |
-- +----------+
-- |     1500 |
-- |     1000 |
-- |      700 |
-- |      600 |
-- |      500 |
-- |      350 |
-- +----------+


-- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables
SELECT 
    Passenger_name AS 'Passenger Name',
    Distance / (SELECT SUM(Distance) FROM passenger) * 100 AS 'Percentage of Distance Travelled'
FROM
    passenger;
-- 						OUTPUT
-- 						======
-- +----------------+----------------------------------+
-- | Passenger Name | Percentage of Distance Travelled |
-- +----------------+----------------------------------+
-- | Sejal          |                           5.3435 |
-- | Anmol          |                          10.6870 |
-- | Pallavi        |                           9.1603 |
-- | Khusboo        |                          22.9008 |
-- | Udit           |                          15.2672 |
-- | Ankur          |                           7.6336 |
-- | Hemant         |                          10.6870 |
-- | Manish         |                           7.6336 |
-- | Piyush         |                          10.6870 |
-- +----------------+----------------------------------+

-- 11) Display the distance, price in three categories in table Price
-- 		a) Expensive if the cost is more than 1000
-- 		b) Average Cost if the cost is less than 1000 and greater than 500
-- 		c) Cheap otherwise
SELECT 
    Distance,
    Price,
    CASE
        WHEN Price > 1000 THEN 'Expensive'
        WHEN Price > 500 THEN 'Average Cost'
        ELSE 'Cheap'
    END AS Category
FROM
    price;
-- 		 		OUTPUT
-- 		 		======
-- +----------+-------+--------------+
-- | Distance | Price | Category     |
-- +----------+-------+--------------+
-- |      350 |   770 | Average Cost |
-- |      500 |  1100 | Expensive    |
-- |      600 |  1320 | Expensive    |
-- |      700 |  1540 | Expensive    |
-- |     1000 |  2200 | Expensive    |
-- |     1200 |  2640 | Expensive    |
-- |     1500 |  2700 | Expensive    |
-- |      500 |   620 | Average Cost |
-- |      600 |   744 | Average Cost |
-- |      700 |   868 | Average Cost |
-- |     1000 |  1240 | Expensive    |
-- |     1200 |  1488 | Expensive    |
-- |     1500 |  1860 | Expensive    |
-- +----------+-------+--------------+
