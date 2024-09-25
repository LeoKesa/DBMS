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
