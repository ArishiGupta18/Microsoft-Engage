--DATA SIMPLFICATION
--By making YYYY as coulmn

select A.MAKE , A.Model ,A.Variant , A.[Ex-Showroom_Price] , B.YYYY ,DateName( month , DateAdd( month , B.MM ,0 ) )  AS MNAME , B.Target_Units , B.Units_Sold  , ((Units_Sold-Target_Units)*100/Target_Units) AS PerAge
from carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID
ORDER BY ((Units_Sold-Target_Units)*100/Target_Units) DESC , [Ex-Showroom_Price] asc



SELECT VEHICLE, [2021],[2022] , ([2022] -[2021])*100/[2021] AS PER_AGE FROM   
(SELECT MAKE +' - ' + MODEL +' ( ' + VARIANT  + ')' AS VEHICLE, CAST(YYYY AS VARCHAR) AS YYYY  , Units_Sold FROM carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID ) Tab1  
PIVOT  
(  
SUM(Units_Sold) FOR [YYYY] IN ([2021],[2022])) AS Tab2  
ORDER BY Tab2.VEHICLE  

SELECT MAKE +' - ' + MODEL +' ( ' + VARIANT  + ')' AS VEHICLE, CAST(YYYY AS VARCHAR) AS YYYY  , sum(Units_Sold) FROM carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID
group by b.yyyy , MAKE +' - ' + MODEL +' ( ' + VARIANT  + ')' 
