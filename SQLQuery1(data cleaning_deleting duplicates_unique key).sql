--select count(*) from carsData
--select * into carDatabk from carsData

/*
-- sql to delete duplicate reords based on make , model ,variant

select make , model ,variant from [carsData] group by make , model ,variant having count(*) > 1

delete  from [carsData] where ID not in (
select max(ID) from [carsData] group by make , model ,variant )

select * from carsData

-- end of duplicate 
*/

--DATA CLEANING
 select * from [dbo].[carsData] where  make is null

  select *  from [dbo].[carsData] where Model like '%Mercedes%' and make is null
  update [dbo].[carsData] SET Make ='Mercedes' where Model like '%Mercedes%' and make is null

  select *  from [dbo].[carsData] where Model like '%Rolls%' and make is null
  update [dbo].[carsData] SET Make ='Rolls‑Royce' where Model like '%Rolls%' and make is null

  select *  from [dbo].[carsData] where Model like '%Go+%' and make is null
  update [dbo].[carsData] SET Make ='Datsun' where Model like '%Go+%' and make is null


 select * from [dbo].[carsData] where  model is null

  select *  from [dbo].[carsData] where Variant like '%Boxster%' and Model is null
  update [dbo].[carsData] SET Model ='Porsche 718 Boxster' where Variant like '%Boxster%' and Model is null

  select *  from [dbo].[carsData] where Variant like '%Cayman%' and Model is null
  update [dbo].[carsData] SET Model ='Porsche 718 Cayman' where Variant like '%Cayman%' and Model is null

  select *  from [dbo].[carsData] where Variant like '%Carrera%' and Model is null
  update [dbo].[carsData] SET Model ='911 Carrera' where Variant like '%Carrera%' and Model is null

select * from [dbo].[carsData] where  Variant is null
  
 
  select *  from [dbo].[carsData] where Make like '%Rolls%' and Variant is null
  update [dbo].[carsData] SET Variant ='V12' where Make like '%Rolls%' and Variant is null

  select *  from [dbo].[carsData] where Make like '%Jaguar%' and Variant is null
  update [dbo].[carsData] SET Variant =' 5.0 V8 Autobiography' where Make like '%Jaguar%' and Variant is null

  select *  from [dbo].[carsData] where Model like '%punto%' and Variant is null
  update [dbo].[carsData] SET Variant ='Grande Punto' where Model like '%punto%' and Variant is null

  select *  from [dbo].[carsData] where Model like '%Linea%' and Variant is null
  update [dbo].[carsData] SET Variant ='Fiat Linea Active' where Model like '%Linea%' and Variant is null

  select *  from [dbo].[carsData] where Model like '%Mercedes%' and Variant is null
  update [dbo].[carsData] SET Variant ='A-Class A200 CDI' where Model like '%Mercedes%' and Variant is null
  
  --select [Ex-showroom_price],  replace(ltrim(rtrim(replace([Ex-Showroom_Price],'Rs.',''))), ',', '') from carsdata

  UPDATE [dbo].[CarsData] SET   [City_Mileage] = ltrim(rtrim(replace(replace([City_Mileage],'km/litre',''),'?','')))
										,[Ex-Showroom_Price] = replace(ltrim(rtrim(replace([Ex-Showroom_Price],'Rs.',''))), ',', '')
										,[Highway_Mileage] = ltrim(rtrim(replace([Highway_Mileage],'km/litre','')))
										,[Displacement]= ltrim(rtrim(replace([Displacement], 'cc' ,'')))
										,[ARAI_Certified_Mileage] = ltrim(rtrim(replace([ARAI_Certified_Mileage],'km/litre','')))
										,[Height] = ltrim(rtrim(replace([Height],'mm','')))
										,[Length] = ltrim(rtrim(replace([Length],'mm','')))
										,[Width] = ltrim(rtrim(replace([Width],'mm','')))
										,[Fuel_Tank_Capacity] = ltrim(rtrim(replace([Fuel_Tank_Capacity],'litres','')))
										,[Ground_Clearance] = ltrim(rtrim(replace([Ground_Clearance],'mm','')))
										,BOOT_SPACE  = ltrim(rtrim(replace(BOOT_SPACE,'litres','')))
select * from carsData

select [Ex-Showroom_Price] as [Ex-Showroom_Price(in Rs.)] from carsData
select [Height] as [Height (in mm)] from carsData
select [Length] as [Length (in mm)] from carsData
select [Width] as [Width (in mm)] from carsData
select [Displacement] as [Displacement (in cc)] from carsData
select [Highway_Mileage] as [Highway_Mileage (in km/litre)] from carsData
select * from carsData

select * into carDatabk1 from carsData 


