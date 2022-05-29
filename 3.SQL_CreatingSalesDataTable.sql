---PREPARATION OF SALE DATA

/*****
in the given data set there was no information regarding sales data so for that we have created a new table 
having parameters like Year(2021, 2022), month, target units, units sold
*****/

  IF OBJECT_ID('salesDataTable', 'U') IS NULL 
	BEGIN 
			CREATE TABLE [dbo].[SalesDataTable](
			[CID] [int] IDENTITY(1,1) NOT NULL,
			[ID] [int] NOT NULL,
			[YYYY] [smallint] NOT NULL,
			[MM] [tinyint] NOT NULL,
			[Target_Units] [int] NOT NULL,
			[Units_Sold] [int] NOT NULL,
			[PerAge] [decimal](18, 2) NOT NULL,
		 CONSTRAINT [PK_SalesDataTable] PRIMARY KEY CLUSTERED 
		(
			[CID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
		 CONSTRAINT [IX_SalesDataTable] UNIQUE NONCLUSTERED 
		(
			[ID] ASC,
			[YYYY] ASC,
			[MM] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]

		
		ALTER TABLE [dbo].[SalesDataTable]  WITH CHECK ADD  CONSTRAINT [FK_SalesDataTable_MstCarData] FOREIGN KEY([ID])
		REFERENCES [dbo].[MstCarData] ([ID])
		
		ALTER TABLE [dbo].[SalesDataTable] CHECK CONSTRAINT [FK_SalesDataTable_MstCarData]
		
	END

Truncate table salesDataTable ;


with Months as 
( 
    select 1 as number
    union all
    select number+1     --recursive call
    from Months 
    where number<12
)   
INSERT INTO SalesDataTable(ID,YYYY,MM,[Target_Units],[Units_Sold],PerAge)
select carsData.id , '2021' AS YYYY, number AS MM,0 as Target_Units,0 as Units_Sold , 0 AS PerAge
from Months , carsData
order by number;




--
--select count (*) from salesDataTable




with Months as 
( 
    select 1 as number
    union all
    select number+1     --recursive call
    from Months 
    where number<12
)   
INSERT INTO SalesDataTable(ID,YYYY,MM,[Target_Units],[Units_Sold],PerAge)
select carsData.id , '2022' AS YYYY, number AS MM,0 as Target_Units,0 as Units_Sold, 0 AS PerAge
from Months , carsData
order by number




