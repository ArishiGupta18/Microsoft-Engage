***Microsoft Engage*** 

**STEPS FOLLOWED:**
1.	Analysed the attributes of the given data set and finalized the requirements 
    •	Target vs sale analysis
    •	Insights of sale data
    •	Model selection from security point of view
2.	Import excel data into SQL server 2014 database
3.	Where operations like data cleaning, normalization through applying required constraints, modelling and many other.
4.	Including additional information like month-year wise target/sales data through randomization.
5.	Once the data is compiled, it is taken as input in a tool named Microsoft Power BI which is used for data analysis and visualization as per user requirement

**DATA COMPILATION STEPS:**
1.	elimination of data redundancy ( Duplicate.sql )
2.	applying proper constraints like ex-showroom price should be int, city_Mileage in decimal (18,2) also the null columns were analysed and proper steps were taken and so on. For that, necessary steps were carried out (Cleaning.sql)
3.	Primary key, foreign key constrains were applied to increase the data efficiency (through sql enterprise database diagram)
4.	Concept of ranking/scaling were introduced based on some special security features (Ranking.sql)
*Tried to set percentile of various attributes different in nature but couldn’t complete due to exams and lack of time.*
5.	Preparation of target/sales data (salesDataTable.sql)

**STEPS TO EXECUTE POWER BI FILES:**
1.	To get the overview of the analysis performed in-memory data, just click on *.pbix file (as mentioned below) 
2.	To see the database structure, restore this (Full backup: engage_car28) database in SQL 2014

**Power BI**
1) 1.pbix ; description
2) 2.pbix ;
3) 3.pbix......

