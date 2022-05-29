# **Microsoft Engage**
###### ***Project: Data Analysis on Automotive Industry***

## **STEPS FOLLOWED:**
1.	Analysed the attributes of the given data set and finalized the requirements 
    - Target vs sale analysis
    - Insights of sale data
    - Model selection from security point of view
2.	Import excel data into SQL server 2014 database
3.	Where operations like data cleaning, normalization through applying required constraints, modelling and many other.
4.	Including additional information like month-year wise target/sales data through randomization.
5.	Once the data is compiled, it is taken as input in a tool named Microsoft Power BI with the help of windows credentials, which is used for data analysis and visualization as per user requirement

## **DATA COMPILATION STEPS:**
1.	elimination of data redundancy ( 1.SQL_DataCleaning.sql )
2.	applying proper constraints like ex-showroom price should be int, city_Mileage in decimal (18,2) also the null columns were analysed and proper steps were taken and so on. For that, necessary steps were carried out (2.SQL_DeleteDuplicateRecords.sql )
3. 	Preparation of target/sales data (3.SQL_CreatingSalesDataTable.sql , 4.SQL_LogicToUpdate_Target_Sale_Data.sql )
4.	Primary key, foreign key constrains were applied to increase the data efficiency (through sql enterprise database diagram)
5.	Concept of ranking/scaling were introduced based on some special security features (5_SQL_Ranking.sql)
> ***Tried to set percentile of various attributes different in nature but couldn’t complete due to exams and lack of time.***

 ## **STEPS TO EXECUTE POWER BI FILES:**
1.	To get the overview of the analysis performed in-memory data, just click on *.pbix file (as mentioned below) 
2.	To see the database structure, restore this (Full backup: CarEnageDataBaseBackUp.zip ) database in SQL 2014

## **Power BI File Description**
**1. Rank_powerBI.pbix :** 
     One can find the best model based on Security Parameters. This security ranking calculation is based on 7 security parameters. Assigning each variant with new          number that gives the measurement of security aspects and high number indicate high security
     
![image](https://user-images.githubusercontent.com/85198302/170871666-d23eaf88-7789-4bad-a5c1-c345b83f2900.png)


**2. YearlySales(in %)byMakeModelVariant.pbix :**
     This gives the visualation of Sales ( year wise , month wise ) wrt the assigned Target and many more dynamic input parameter are also the choice of users.
     
![image](https://user-images.githubusercontent.com/85198302/170871636-cd1bd4f4-c4e6-4bf3-bee8-5bee8f2deadf.png)


**3. DataAnalysisWithDynamicFilter.pbix :**
     In this model we have analysed the data set based on make, model, variant, price range, no. of airbags, handbrake, rainsensing wipers etc., in this we can add           features as per our requirement and obtain the analysis accordingly.
     
![image](https://user-images.githubusercontent.com/85198302/170871583-9eeeaab7-5902-4ac6-9d9b-17767eddec91.png)


