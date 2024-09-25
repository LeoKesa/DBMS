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