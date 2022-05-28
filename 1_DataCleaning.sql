
--## DATA CLEANING ##

--*****some columns have make as null so for making the data set more efficient those null values have been modified *****
 select * from [dbo].[carsData] where  make is null

  select *  from [dbo].[carsData] where Model like '%Mercedes%' and make is null
  update [dbo].[carsData] SET Make ='Mercedes' where Model like '%Mercedes%' and make is null

  select *  from [dbo].[carsData] where Model like '%Rolls%' and make is null
  update [dbo].[carsData] SET Make ='Rolls‑Royce' where Model like '%Rolls%' and make is null

  select *  from [dbo].[carsData] where Model like '%Go+%' and make is null
  update [dbo].[carsData] SET Make ='Datsun' where Model like '%Go+%' and make is null


--*****some columns have model as null so for making the data set more efficient those null values have been modified *****
 select * from [dbo].[carsData] where  model is null

  select *  from [dbo].[carsData] where Variant like '%Boxster%' and Model is null
  update [dbo].[carsData] SET Model ='Porsche 718 Boxster' where Variant like '%Boxster%' and Model is null

  select *  from [dbo].[carsData] where Variant like '%Cayman%' and Model is null
  update [dbo].[carsData] SET Model ='Porsche 718 Cayman' where Variant like '%Cayman%' and Model is null

  select *  from [dbo].[carsData] where Variant like '%Carrera%' and Model is null
  update [dbo].[carsData] SET Model ='911 Carrera' where Variant like '%Carrera%' and Model is null


--*****some columns have varient as null so for making the data set more efficient those null values have been modified *****
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


/*****
there were some colums which had ",","?"," ", and some other strings after and before them due to which we were not able to change their data 
type to some numeric data type for comparing them so for that we have performed the following block of code 
*****/


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


--*****through the above queries we have trimed UNITS of some columns, so for getting the idea that which parameter is in which unit we have modified the column name*****
select [Ex-Showroom_Price] as [Ex-Showroom_Price(in Rs.)] from carsData
select [Height] as [Height (in mm)] from carsData
select [Length] as [Length (in mm)] from carsData
select [Width] as [Width (in mm)] from carsData
select [Displacement] as [Displacement (in cc)] from carsData
select [Highway_Mileage] as [Highway_Mileage (in km/litre)] from carsData
select * from carsData

--*****at last we have again taken backup *****
select * into carDatabk1 from carsData 

