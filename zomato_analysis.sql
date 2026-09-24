create database zomato;

USE zomato;
select * from main1;
select * from country;

select count('restaurant name') from main1;

------------------------ Find the Numbers of Resturants based on City and Country
SELECT c.Country, COUNT(m.RestaurantID)
FROM main1 m
JOIN country c
ON m.CountryCode = c.`ï»¿Country Code`
GROUP BY c.Country;

SELECT City, COUNT(RestaurantID)
FROM main1
GROUP BY City;

---------------------------------------- Numbers of Resturants opening based on Year , Quarter , Month
SELECT 
    `Year opening` AS Year,
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM main1
GROUP BY `Year opening`
ORDER BY Year;

SELECT 
    Quarter,
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM main1
GROUP BY Quarter
ORDER BY Quarter;

SELECT 
    `Month Name` AS Month,
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM main1
GROUP BY `Month Name`
ORDER BY Number_of_Restaurants DESC;


---------------------------------------- Count of Resturants based on Average Ratings

SELECT 
    Rating AS Average_Rating,
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM main1
GROUP BY Rating
ORDER BY Rating;


---------------------------------------- Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets 
SELECT 
    CASE 
        WHEN Average_Cost_for_two <= 300 THEN 'Low (≤300)'
        WHEN Average_Cost_for_two BETWEEN 301 AND 700 THEN 'Medium (301–700)'
        WHEN Average_Cost_for_two BETWEEN 701 AND 1500 THEN 'High (701–1500)'
        ELSE 'Premium (>1500)'
    END AS Price_Bucket,
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM main1
GROUP BY Price_Bucket
ORDER BY Number_of_Restaurants DESC;

---------------------------------------- Percentage of Resturants based on "Has_Table_booking" 
SELECT 
    Has_Table_booking,
    COUNT(RestaurantID) AS Total_Restaurants,
    ROUND(
        COUNT(RestaurantID) * 100.0 / 
        (SELECT COUNT(*) FROM main1),
    2) AS Percentage
FROM main1
GROUP BY Has_Table_booking;


---------------------------------------- Percentage of Resturants based on "Has_Online_delivery"
SELECT 
    Has_Online_delivery,
    COUNT(RestaurantID) AS Total_Restaurants,
    ROUND(
        COUNT(RestaurantID) * 100.0 / 
        (SELECT COUNT(*) FROM main1),
    2) AS Percentage
FROM main1
GROUP BY Has_Online_delivery;
