--select count(*) from carsData

--*****taking backup (in case it gets formatted or you make some unwanted changes), we will be deleting these extra backup files in the end*****
--select * into carDatabk from carsData


--##DELETING DUPLICATES ##

-- *****sql to delete duplicate records based on make , model ,variant*****

select make , model ,variant from [carsData] group by make , model ,variant having count(*) > 1

delete  from [carsData] where ID not in (
select max(ID) from [carsData] group by make , model ,variant )

select * from carsData

-- end of duplicate 

