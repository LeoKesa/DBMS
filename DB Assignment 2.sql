/*
DB Assignment 2
Leonidas Kesaris
9/23/2024
*/

-- //////////////////////////////////////////////Problem 1////////////////////////////////////////////////////

-- uses the restaurant database in which the tables for each CSV file are located
use restaurant; 

-- selects restaurants name and restID as well as calculates average price of food for each restaurant
select restaurants.restID,restaurants.name,avg(foods.price) AS AVG_Food_price
from restaurants

-- joins restaurants table with serves relational table using restID to indicate food items offered at each restaurant
join serves on restaurants.restID = serves.restID

-- joins serves table with foods table using foodID  to get price for each food item 
join foods on serves.foodID = foods.foodID

-- Groups the results by restaurant ID and restaurant name to then show average food item price per each unique restaurant
GROUP BY restaurants.restID, restaurants.name;

-- ///////////////////////////start of Problem 2 /////////////////////

-- Uses the restaurant database in which the tables for each CSV file are located
use restaurant;

-- Selects restaurant name, restID and the maximum price of the food served and gives it the alias of Max_price for use in the table
select restaurants.restID,restaurants.name,MAX(foods.price) AS Max_price
from restaurants

-- Joins the restaurants table with the serves table via restID 
join serves on restaurants.restID = serves.restID

-- Joins the foods table with the serves table via food ID to to aquire the price of each food item 
join foods on serves.foodID = foods.foodID

-- Groups the resulting output by restaurant ID and restaurant name with Max_price matching each unique restaurant
GROUP BY restaurants.restID, restaurants.name;

-- ///////////////////////////////////////////Problem 3 /////////////////////////////////////////

-- Uses the restaurant database in which the tables for each CSV file are located
use restaurant;

-- selects the restaurants ID, name and counts the number of food types served at each restaurant using the count function which is given the alias Num_Rest_Food_Types
select restaurants.restID,restaurants.name,count(foods.type) AS Num_Rest_Food_Types
from restaurants

-- links restaurants table and servers via restID giving access to food items served by restaurants
join serves on restaurants.restID = serves.restID

-- links serves table with the foods table via foodID enabling retrieval of food type
join foods on serves.foodID = foods.foodID

-- Group by allows the counting function to count each restaurant individually instead of having the counts value simply total all food types. 
GROUP BY restaurants.RestID, restaurants.name;

-- ////////////////////////////////////////////////Problem 4////////////////////////////////////////////////////////////////

-- Uses the restaurant database in which the tables for each CSV file are located
use restaurant;

-- Selects chefID and chef name and calculates the average price of the food for each restaraunt the chef works. The resulting value is given alias avg_price
select chefs.chefID,chefs.name, AVG(foods.price) AS avg_price
from chefs

-- Connects chefs table to works via chefID creating a relation between chefs and restaurants they work at.
join works on chefs.chefID = works.chefID

-- Connects serves table to works via restID which enables access to food items at specific restaurants chefs work 
join serves on works.restID = serves.restID

-- connects serves table to foods table via foodID to retrieve the prices of food items at specific restaurants
join foods on serves.foodID = foods.foodID

-- groups by chef ID and chef name in order to calculate average food price is per each individual chef 
group by chefs.chefID, chefs.name;

-- ////////////////////////////////////////Problem 5/////////////////////////////////////////////////
-- Uses the restaurant database in which the tables for each CSV file are located
use restaurant;

-- selects restaurant name and calculate the average price of food at said restaurant in the alias AVG_price
select restaurants.name, AVG(foods.price) AS AVG_Price
from restaurants

-- links restaurants with serves via restID giving access to each restaurant's food items
Join serves on restaurants.restID = serves.restID

-- links serves and foods via foodID which allows retrieval of food prices for the food items of each restaurant
join foods on serves.foodID = foods.foodID

-- groups by restaurant ID and name to maintain average price for individual restaurants rather than an aggregate. 
group by restaurants.restID, restaurants.name

-- orders results of the function average in descending order so the highest value is given.
order by AVG_Price DESC

-- Restricts output to 1 value to ensure only the highest value for average price is given along with the restaurant's name. 
LIMIT 1;

-- ///////////////////////////////////////// Extra Credit ///////////////////////////////////////////////////////////////////

-- Selects chef name, average price of each food item served at chef restaurant, and the restaurant's name
select chefs.name, AVG(foods.price) AS AVG_price, group_concat(DISTINCT restaurants.name) AS restaurants
From chefs

-- Links the chefs table with works 
JOIN works on chefs.chefID = works.chefID

-- Joins the work table with the serves table to aquire good items from restaurants
JOIN serves on works.restID = serves.restID 

-- Joins the serves table with the foods table to get the food item price
JOIN foods on serves.foodID = foods.foodID

-- Joins the serves table with the restaurants table to retrieve restaurant names
JOIN restaurants on serves.restID = restaurants.restID

-- Groups the results of the query by chefID and chefs names to calculate average food price per chef
GROUP BY chefs.chefID, chefs.name

-- Orders the results by average food price in descending order to only show the chef with the highest average food price
Order by AVG_price DESC
LIMIT 1;