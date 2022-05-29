-- Import Excel Data in Sql Server Table ie carsData

-- Create New Coulmn ID as an identity column


	IF NOT EXISTS (SELECT * FROM syscolumns  WHERE ID=OBJECT_ID('[carsData]') AND NAME='ID')
	BEGIN
	Alter Table [carsData] Add ID Int Identity(1, 1) 
	END 

--## DATA CLEANING ##
--*****some columns have make as null so for making the data set more efficient those null values have been modified *****
  IF exists (select ID  from [dbo].[carsData] where Model like '%Mercedes%' and make is null)
  BEGIN
  update [dbo].[carsData] SET Make ='Mercedes' where Model like '%Mercedes%' and make is null
  END

  IF exists (select ID  from [dbo].[carsData] where Model like '%Rolls%' and make is null)
  BEGIN
  update [dbo].[carsData] SET Make ='Rolls‑Royce' where Model like '%Rolls%' and make is null
  END

  IF exists (select ID  from [dbo].[carsData] where Model like '%Go+%' and make is null)
  BEGIN
  update [dbo].[carsData] SET Make ='Datsun' where Model like '%Go+%' and make is null
  END
  IF exists (select ID  from [dbo].[carsData] where Variant like '%Boxster%' and Model is null)
  BEGIN
    update [dbo].[carsData] SET Model ='Porsche 718 Boxster' where Variant like '%Boxster%' and Model is null
  END

  IF exists ( select ID  from [dbo].[carsData] where Variant like '%Cayman%' and Model is null)
  BEGIN
   update [dbo].[carsData] SET Model ='Porsche 718 Cayman' where Variant like '%Cayman%' and Model is null
  END

  IF exists (select ID  from [dbo].[carsData] where Variant like '%Carrera%' and Model is null)
  BEGIN
  update [dbo].[carsData] SET Model ='911 Carrera' where Variant like '%Carrera%' and Model is null
  END

--*****some columns have varient as null so for making the data set more efficient those null values have been modified *****
--select * from [dbo].[carsData] where  Variant is null
 IF exists (select ID  from [dbo].[carsData] where Make like '%Rolls%' and Variant is null)
  BEGIN
  update [dbo].[carsData] SET Variant ='V12' where Make like '%Rolls%' and Variant is null
  END

  IF exists (select ID  from [dbo].[carsData] where Make like '%Jaguar%' and Variant is null)
  BEGIN
  update [dbo].[carsData] SET Variant =' 5.0 V8 Autobiography' where Make like '%Jaguar%' and Variant is null
  END

  IF exists (select ID  from [dbo].[carsData] where Model like '%punto%' and Variant is null)
  BEGIN
    update [dbo].[carsData] SET Variant ='Grande Punto' where Model like '%punto%' and Variant is null
  END

  IF exists ( select ID  from [dbo].[carsData] where Model like '%Linea%' and Variant is null)
  BEGIN
    update [dbo].[carsData] SET Variant ='Fiat Linea Active' where Model like '%Linea%' and Variant is null
  END

  IF exists ( select ID  from [dbo].[carsData] where Model like '%Mercedes%' and Variant is null)
  BEGIN
    update [dbo].[carsData] SET Variant ='A-Class A200 CDI' where Model like '%Mercedes%' and Variant is null
  END


 ALTER TABLE [dbo].[carsData] ALTER COLUMN MAKE		VARCHAR(100) NOT NULL;  
 ALTER TABLE [dbo].[carsData] ALTER COLUMN MODEL	VARCHAR(100) NOT NULL;  
 ALTER TABLE [dbo].[carsData] ALTER COLUMN Variant VARCHAR(100) NOT NULL; 
 -- CREATE UNIQUE INDEX ON MAKE , MODEL , VARIANT FOR THE UNIQUNESS OF EACH RECORD THROUGH DESIGN MODE
  

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


 update [carsData]  set [City_Mileage] = replace([City_Mileage],',','.') where [City_Mileage] like '%,%'
 update  [carsData] set [City_Mileage] ='12.6'  where [City_Mileage] ='12.5-12.7' 

 ALTER TABLE [CarsData] ALTER COLUMN [City_Mileage]		 DECIMAL(18,10) NULL
 ALTER TABLE [CarsData] ALTER COLUMN [Ex-Showroom_Price] INT NULL
 ALTER TABLE [CarsData] ALTER COLUMN [Fuel_Tank_Capacity] INT NULL
 ALTER TABLE [CarsData] ALTER COLUMN [BOOT_SPACE]  INT NULL



