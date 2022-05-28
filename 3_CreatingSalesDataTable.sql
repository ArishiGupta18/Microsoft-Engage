---PREPARATION OF SALE DATA

/*****
in the given data set there was no information regarding sales data so for that we have created a new table 
having parameters like Year(2021, 2022), month, target units, units sold
*****/
with Months as 
( 
    select 1 as number
    union all
    select number+1     --recursive call
    from Months 
    where number<12
)   
--INSERT INTO SalesDataTable(ID,YYYY,MM,[Target_Units],[Units_Sold])
select carsData.id , '2021' AS YYYY, number AS MM,0 as Target_Units,0 as Units_Sold
from Months , carsData
order by number




--truncate table salesDataTable 
--select count (*) from salesDataTable

with Months as 
( 
    select 1 as number
    union all
    select number+1     --recursive call
    from Months 
    where number<12
)   
INSERT INTO SalesDataTable(ID,YYYY,MM,[Target_Units],[Units_Sold])
select carsData.id , '2022' AS YYYY, number AS MM,0 as Target_Units,0 as Units_Sold
from Months , carsData
order by number


