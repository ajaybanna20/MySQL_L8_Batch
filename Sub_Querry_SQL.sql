 use world;
 select * from city;
 
 -- SUBQUERRY 
 
 -- Q.1 get the name of the city where the district of the city is same for the city abudhabi 
 
select name from city
where district = ( select district from city where name = 'abu dhabi' );

 -- Q.2 get all the columns from the city table where the population is the maximum
 
select * from city
where population = ( select max(population) from city );

 -- Q.3 get a district and name of the city where the county code is same for herat
 
select district, name from city
where countrycode = ( select countrycode from city where name = 'herat' );

 -- Q.4 get the disrict , city and populatoion for all the countries where amerstdam is present and sort this data by the population
 
select district, name, population from city
where countrycode = ( select countrycode from city where name = 'amsterdam' )
order by population;
 
 -- Singel row 


