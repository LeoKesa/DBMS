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