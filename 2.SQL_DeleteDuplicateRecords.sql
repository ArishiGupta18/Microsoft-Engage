-- Then Delete Deuplicate Records based on Make , Model , Variant 
-- SQL to Check the duplicacy is as 
-- select make , model ,variant from [carsData] group by make , model ,variant having count(*) > 1
Delete From [carsData] where ID not in (
select max(ID) from [carsData] group by make , model ,variant )