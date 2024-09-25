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