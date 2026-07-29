create database bike_db;

use bike_db;
CREATE TABLE stations (
station_id INT PRIMARY KEY,
station_name VARCHAR(50),
zone VARCHAR(20),
capacity INT,
opened_year INT
);
CREATE TABLE rides (
ride_id INT PRIMARY KEY,
station_id INT,
rider_type VARCHAR(20),
ride_date DATE,
duration_min INT,
distance_km DECIMAL(4,1),
fare DECIMAL(6,2),
FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

select * from rides;
select database();
insert into stations values
(1,'Riverside Dock','North',20,2019),
(2,'Amber Plaza','Central',35,2018),
(3,'Kite Hill','North',15,2021),
(4,'Old Mill Yard','East',25,2017),
(5,'Glass Bridge','Central',40,2020),
(6,'Fern Gully','West',12,2022),
(7,'Copper Lane','East',18,2016),
(8,'Willow Bend','West',22,2023),
(9,'Stone Arch','South',30,2023);

select * from stations;
insert into rides values
(1,1,'Member','2024-03-02',22,4.2,3.50),
(2,1,'Casual','2024-03-05',45,7.8,9.75),
(3,2,'Member','2024-03-05',18,3.1,2.80),
(4,2,'Student','2024-03-11',33,6.0,4.20),
(5,3,'Casual','2024-03-14',12,1.9,2.10),
(6,1,'Member','2024-04-01',27,5.4,4.10),
(7,4,'Student','2024-04-03',55,9.5,6.30),
(8,5,'Member','2024-04-07',15,2.6,2.40),
(9,5,'Casual','2024-04-09',62,11.2,13.50),
(10,2,'Member','2024-04-12',24,4.8,3.90),
(11,6,'Student','2024-04-18',40,7.1,5.00),
(12,3,'Member','2024-05-02',19,3.3,2.95),
(13,7,'Casual','2024-05-04',50,8.9,11.00),
(14,5,'Student','2024-05-08',29,5.2,3.75),
(15,1,'Casual','2024-05-13',36,6.4,8.20),
(16,4,'Member','2024-05-15',21,4.0,3.30),
(17,2,'Casual','2024-05-19',48,8.1,10.40),
(18,6,'Member','2024-05-22',17,2.9,2.55),
(19,5,'Member','2024-06-01',31,6.7,4.60),
(20,7,'Student','2024-06-04',44,7.6,5.40),
(21,1,'Student','2024-06-09',26,4.9,3.60),
(22,3,'Casual','2024-06-11',58,10.3,12.25),
(23,4,'Casual','2024-06-15',39,6.8,8.60),
(24,2,'Member','2024-06-20',23,4.4,3.70),
(25,5,'Casual','2024-06-25',53,9.7,12.80);

select * from rides;
-- ans 1
select rider_type,
count(*) as total_rides,
sum(fare) as total_fare
from rides
group by rider_type
having total_rides > 7
order by total_fare desc;

-- ans 2
select station_id,
count(*) as ride_count,
avg(duration_min) as avg_duration
from rides
group by station_id
having avg(duration_min) > 30
order by avg_duration desc;

-- ans 3
select month(ride_date) as ride_month,
count(*) as total_rides,
sum(distance_km) as total_distance
from rides
group by month(ride_date)
having sum(distance_km) > 30
order by ride_month;

-- ans 4
select rider_type,
max(duration_min) as longest_ride,
min(duration_min) as shortest_ride,
avg(duration_min) as avg_ride
from rides
group by rider_type
having max(duration_min) >= 50
order by longest_ride desc;

-- ans 5
select station_id,
rider_type,
count(*) as ride_count,
sum(distance_km) as total_distance
from rides
group by station_id,rider_type
having sum(distance_km) > 10
order by station_id;

-- ans 6
select station_id,
count(distinct rider_type) as rider_type_count,
count(*) as total_rides,
avg(fare) as avg_fare
from rides
group by station_id
having count(distinct rider_type) = 3
order by station_id;

-- ans 7
select s.station_id,
s.station_name,
s.zone,
r.ride_id,
r.rider_type,
r.fare
from stations s
left join rides r
on s.station_id = r.station_id
and month(r.ride_date) = 6
and year(r.ride_date) = 2024
order by s.station_id,r.ride_id;

-- ans 8
select s.station_id,
s.station_name,
s.zone,
count(r.ride_id) as total_rides,
coalesce(sum(r.fare),0.0) as total_revenue
from stations s
left join rides r
on s.station_id = r.station_id
group by s.station_id,s.station_name,s.zone
order by total_rides desc,s.station_id;

-- ans 9
          -- types of sql languages

-- ddl (data definition language) – create, alter, drop, truncate
-- dml (data manipulation language) – insert, update, delete
-- dql (data query language) – select
-- dcl (data control language) – grant, revoke
-- tcl (transaction control language) – commit, rollback, savepoint

-- ans 10

-- joins in sql
-- joins are used to combine data from two or more tables based on a related column.

   -- types of joins

-- inner join – returns matching records from both tables.
-- left join – returns all records from the left table and matching records from the right table.
-- right join – returns all records from the right table and matching records from the left table.
-- full join – returns all records from both tables, matching and non-matching.
-- cross join – returns every possible combination of rows from both tables.
-- self join – joins a table with itself.


