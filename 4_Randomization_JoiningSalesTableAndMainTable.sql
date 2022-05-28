/*****
Earlier we have created the sales data table now we need to fill the table with the data
Randomization of the data is done with one condition that unit_sold= target_unit+-(20%)

*****/

--update  SalesDataTable set Target_Units= abs(checksum(NewId()) % 99)+1 --, Units_Sold=abs(checksum(NewId()) % 99)+1
select * from SalesDataTable
--update  SalesDataTable set Units_Sold= (checksum(NewId()) % 20)
--update  SalesDataTable set Units_Sold= Target_Units+(Units_Sold*.01)*Target_Units --, Units_Sold=abs(checksum(NewId()) % 99)+1


select (Units_Sold*.01) * Target_Units from SalesDataTable where Target_Units >Units_Sold
select * from SalesDataTable where Target_Units <Units_Sold

select  abs(checksum(NewId()) % 100) ,checksum(NewId())


SELECT COUNT(*) FROM carsData

/*****
after creating the sales table we need to join it with our main table i.e. carsData
the inner join made here is made with the help of ID column which is same and is present in both the tables
*****/
select A.* , B.*
from carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID

