
UPDATE carsData set 
[Navigation_SystemRank]					= case when Navigation_System ='Y' then 1 else 0 end,
ABS_Rank								= case when [ABS_(Anti-lock_Braking_System)] ='Y' then 1 else 0 end,
[Fasten_Seat_Belt_WarningRank]			= case when Fasten_Seat_Belt_Warning ='Y' then 1 else 0 end,
[Passenger_Side_Seat-Belt_ReminderRank] = case when [Passenger_Side_Seat-Belt_Reminder] ='Y' then 1 else 0 end,
High_Speed_Alert_SystemRank				= case when High_Speed_Alert_System ='Y' then 1 else 0 end,
Central_LockingRank						= case when Central_Locking ='Y' then 1 else 0 end,
Child_Safety_LocksRank					= case when Child_Safety_Locks ='Y' then 1 else 0 end,
Engine_Malfunction_LightRank			= case when Engine_Malfunction_Light ='Y' then 1 else 0 end,
Low_Fuel_WarningRank					= case when Low_Fuel_Warning ='Y' then 1 else 0 end,
Engine_ImmobilizerRank					 = case when Engine_Immobilizer ='Y' then 1 else 0 end



TRUNCATE TABLE MstCarData
--INSERT INTO #tblRank ( ID,MAKE ,MODEL,VARIANT,fuel_tank_capacity ,[Ex-Showroom_Price] ,city_Mileage ,BOOT_SPACE, [ABS_(Anti-lock_Braking_System)], 
--Central_Locking,Central_LockingRank,Child_Safety_Locks,Child_Safety_LocksRank, Engine_Malfunction_Light,Engine_Malfunction_LightRank, 
--Low_Fuel_Warning,Low_Fuel_WarningRank, Engine_Immobilizer,Engine_ImmobilizerRank, High_Speed_Alert_System,High_Speed_Alert_SystemRank,
--[Passenger_Side_Seat-Belt_Reminder],[Passenger_Side_Seat-Belt_ReminderRank], Fasten_Seat_Belt_Warning,Fasten_Seat_Belt_WarningRank, 
--Navigation_System,Navigation_SystemRank)   

INSERT INTO MstCarData (
MAKE ,MODEL,VARIANT ,fuel_tank_capacity,[Ex-Showroom_Price] ,city_Mileage , BOOT_SPACE, [ABS_(Anti-lock_Braking_System)], ABS_Rank,
Central_Locking,Central_LockingRank,Child_Safety_Locks,Child_Safety_LocksRank, Engine_Malfunction_Light,Engine_Malfunction_LightRank, 
Low_Fuel_Warning,Low_Fuel_WarningRank, Engine_Immobilizer,Engine_ImmobilizerRank, High_Speed_Alert_System,High_Speed_Alert_SystemRank,
[Passenger_Side_Seat-Belt_Reminder],[Passenger_Side_Seat-Belt_ReminderRank],Fasten_Seat_Belt_Warning,Fasten_Seat_Belt_WarningRank, 
Navigation_System,Navigation_SystemRank ,SecurityRank)

SELECT  MAKE ,MODEL,VARIANT ,fuel_tank_capacity,[Ex-Showroom_Price] ,city_Mileage ,BOOT_SPACE, [ABS_(Anti-lock_Braking_System)], ABS_Rank,
Central_Locking,Central_LockingRank,Child_Safety_Locks,Child_Safety_LocksRank, Engine_Malfunction_Light,Engine_Malfunction_LightRank, 
Low_Fuel_Warning,Low_Fuel_WarningRank, Engine_Immobilizer,Engine_ImmobilizerRank, High_Speed_Alert_System,High_Speed_Alert_SystemRank,
[Passenger_Side_Seat-Belt_Reminder],[Passenger_Side_Seat-Belt_ReminderRank],Fasten_Seat_Belt_Warning,Fasten_Seat_Belt_WarningRank, 
Navigation_System,Navigation_SystemRank,

[Navigation_SystemRank]	+ ABS_Rank + [Fasten_Seat_Belt_WarningRank] + [Passenger_Side_Seat-Belt_ReminderRank] +
High_Speed_Alert_SystemRank	+ Central_LockingRank + Child_Safety_LocksRank + Engine_Malfunction_LightRank +	
Low_Fuel_WarningRank +	Engine_ImmobilizerRank as SecurityRank			
FROM carsData






--DECLARE @MY_SCALE AS INT = 10
--DECLARE @MAX_fuel_tank_capacity AS DECIMAL(18,2) , @MIN_fuel_tank_capacity AS DECIMAL(18,2)
--DECLARE @MAX_Price AS DECIMAL(18,2) , @MIN_Price AS DECIMAL(18,2)
--DECLARE @MAX_city_Mileage AS DECIMAL(18,2) , @MIN_city_Mileage AS DECIMAL(18,2)
--DECLARE @MAX_BOOT_SPACE AS DECIMAL(18,2) , @MIN_BOOT_SPACE AS DECIMAL(18,2)

		
--SELECT 
--@MAX_fuel_tank_capacity = ISNULL(MAX(fuel_tank_capacity),0)  ,	@MIN_fuel_tank_capacity = ISNULL(MIN(fuel_tank_capacity),0) , 
--@MAX_Price				= ISNULL(MAX([Ex-Showroom_Price]),0) ,	@MIN_Price				= ISNULL(MIN([Ex-Showroom_Price]),0)  ,
--@MAX_city_Mileage		= ISNULL(MAX([city_Mileage]),0)		 ,	@MIN_city_Mileage		= ISNULL(MIN([city_Mileage]),0)  ,
--@MAX_BOOT_SPACE			= ISNULL(MAX([BOOT_SPACE]),0)		 ,	@MIN_BOOT_SPACE			= ISNULL(MIN([BOOT_SPACE]),0)  

--FROM #tblRank
				
--DECLARE @MY_FUEL_FACTOR					AS DECIMAL(18,10)			= @MY_SCALE / (@MAX_fuel_tank_capacity		- @MIN_fuel_tank_capacity) 
--DECLARE @MY_PRICE_FACTOR				AS DECIMAL(18,10)			= @MY_SCALE / (@MAX_Price					- @MIN_Price) 
--DECLARE @MY_city_Mileage_FACTOR			AS DECIMAL(18,10)			= @MY_SCALE / (@MAX_city_Mileage			- @MIN_city_Mileage) 
--DECLARE @MY_BOOT_SPACE_FACTOR			AS DECIMAL(18,10)			= @MY_SCALE / (@MAX_BOOT_SPACE				- @MIN_BOOT_SPACE)

		
				
--PRINT @MY_FUEL_FACTOR
--PRINT @MY_PRICE_FACTOR
--PRINT @MY_city_Mileage_FACTOR
--PRINT @MY_BOOT_SPACE_FACTOR
----PRINT @MAX_fuel_tank_capacity
----PRINT @MIN_fuel_tank_capacity
----PRINT CAST(10/90.0 AS DECIMAL(18,2))
----SELECT fuel_tank_capacity_rank , fuel_tank_capacity - @MIN_fuel_tank_capacity ,@MY_FACTOR  FROM #tblRank



--update carsData

--SET fuel_tank_capacity_rank  =  (fuel_tank_capacity		- @MIN_fuel_tank_capacity) * @MY_FUEL_FACTOR ,
--    [Ex-Showroom_Price_rank] =  ([Ex-Showroom_Price]	- @MIN_Price			 ) * @MY_PRICE_FACTOR,
--	city_Mileage_rank		 =  (city_Mileage			- @MIN_city_Mileage		 ) * @MY_city_Mileage_FACTOR,
--	BOOT_SPACE_rank			 =  (BOOT_SPACE				- @MIN_BOOT_SPACE		 ) * @MY_BOOT_SPACE_FACTOR




		
		
		
				