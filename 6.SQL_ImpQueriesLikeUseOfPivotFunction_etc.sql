-- sql for YYYY wise Target/Sales Data
BEGIN
	TRUNCATE TABLE YearlySalesData

	INSERT INTO YearlySalesData (ID,MAKE,MODEL,VARIANT,[Ex-Showroom_Price],YYYY,TOT_TARGET,TOT_SALE,PER) 
	select a.id,a.make,a.model,a.Variant,a.[Ex-Showroom_Price] ,b.yyyy, b.Target , b.sales , (b.sales - b.Target)*100/b.Target as [Per]
	from carsData a inner join 
	(
	select id, YYYY , sum(Target_Units) as target , sum(Units_Sold) as sales from SalesDataTable group by id, YYYY
	) B on a.id=b.id
	order by a.make,  (b.sales - b.Target)*100/b.Target desc, a.[Ex-Showroom_Price] asc

END

-- sql for YYYY-MM wise Target/Sales Data
BEGIN
	select A.MAKE , A.Model ,A.Variant , A.[Ex-Showroom_Price] , B.YYYY ,DateName( month , DateAdd( month , B.MM ,0 ) )  AS MNAME , B.Target_Units , B.Units_Sold  , ((Units_Sold-Target_Units)*100/Target_Units) AS PerAge
	from carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID
	ORDER BY ((Units_Sold-Target_Units)*100/Target_Units) DESC , [Ex-Showroom_Price] asc
END


-- Use of Pivot Function 
BEGIN
	SELECT VEHICLE, [2021],[2022] , ([2022] -[2021])*100/[2021] AS PER_AGE FROM   
	(SELECT MAKE +' - ' + MODEL +' ( ' + VARIANT  + ')' AS VEHICLE, CAST(YYYY AS VARCHAR) AS YYYY  , Units_Sold FROM carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID ) Tab1  
	PIVOT  
	(  
	SUM(Units_Sold) FOR [YYYY] IN ([2021],[2022])) AS Tab2  
	ORDER BY Tab2.VEHICLE  

	SELECT MAKE +' - ' + MODEL +' ( ' + VARIANT  + ')' AS VEHICLE, CAST(YYYY AS VARCHAR) AS YYYY  , SUM(Units_Sold) AS TOT_Units_Sold FROM carsData A INNER JOIN SalesDataTable B ON A.ID = B.ID
	group by b.yyyy , MAKE +' - ' + MODEL +' ( ' + VARIANT  + ')' 
END