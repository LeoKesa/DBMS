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


