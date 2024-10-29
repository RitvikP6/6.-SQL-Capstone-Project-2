CREATE TABLE nomnom (
    NAME TEXT,
    NEIGHBOURHOOD TEXT,
    CUISINE TEXT,
    REVIEW REAL,
    PRICE TEXT,
    HEALTH TEXT
);

INSERT INTO nomnom (NAME, NEIGHBOURHOOD, CUISINE, REVIEW, PRICE, HEALTH) VALUES
    ('Sushi Zen', 'Downtown', 'Japanese', 4.7, '$$$', 'A'),
    ('Pasta Fiesta', 'Westside', 'Italian', 4.3, '$$', 'B'),
    ('Burger Town', 'North End', 'American', 4.0, '$', 'C'),
    ('Green Eats', 'Uptown', 'Vegetarian', 4.8, '$$', 'A'),
    ('Spicy Palace', 'Eastside', 'Indian', 4.5, '$$', 'B'),
    ('Oceans Catch', 'Waterfront', 'Seafood', 4.6, '$$$', 'A'),
    ('Taco Haven', 'Midtown', 'Mexican', 4.2, '$', 'C'),
    ('Pho Real', 'Chinatown', 'Vietnamese', 4.4, '$', 'B'),
    ('Bistro Belle', 'Downtown', 'French', 4.9, '$$$', 'A'),
    ('Pizza Planet', 'Westside', 'Italian', 3.8, '$', 'C'),
    ('Curry House', 'Eastside', 'Indian', 4.3, '$$', 'B'),
    ('Bowl of Soul', 'South End', 'Soul Food', 4.1, '$$', 'C'),
    ('BBQ Bliss', 'Midtown', 'Barbecue', 4.5, '$$', 'B'),
    ('Falafel Feast', 'Uptown', 'Mediterranean', 4.6, '$', 'A'),
    ('Tempura Tower', 'Downtown', 'Japanese', 4.7, '$$$', 'B');

-- Select all rows in the nomnom table
SELECT * FROM nomnom;

-- Select distinct neighborhoods
SELECT DISTINCT NEIGHBOURHOOD FROM nomnom;

-- Select distinct cuisine types
SELECT DISTINCT CUISINE FROM nomnom;

-- Select all restaurants with Japanese cuisine
SELECT * FROM nomnom WHERE CUISINE = 'Japanese';

-- Select all restaurants with a review rating of 4.5 or higher
SELECT * FROM nomnom WHERE REVIEW >= 4.5;

-- Select Indian cuisine restaurants with a price of $$
SELECT * FROM nomnom WHERE CUISINE = 'Indian' AND PRICE = '$$';

-- Select all restaurants with "Pizza" in their name
SELECT * FROM nomnom WHERE NAME LIKE '%Pizza%';

-- Select all restaurants in Midtown, Eastside, or Downtown
SELECT * FROM nomnom WHERE NEIGHBOURHOOD IN ('Midtown', 'Eastside', 'Downtown');

-- Select the top 4 highest-rated restaurants
SELECT * FROM nomnom ORDER BY REVIEW DESC LIMIT 4;

-- Select all records where the health rating is 'A'
SELECT * FROM nomnom WHERE HEALTH = 'A';

-- Count the number of unique cuisines offered in the database
SELECT COUNT(DISTINCT CUISINE) AS UniqueCuisines FROM nomnom;

-- Calculate the average review score for all restaurants
SELECT AVG(REVIEW) AS AverageReview FROM nomnom;

-- Find all restaurants in 'Downtown' with a review of 4.5 or higher
SELECT * FROM nomnom WHERE NEIGHBOURHOOD = 'Downtown' AND REVIEW >= 4.5;

-- Get the highest-rated restaurant in each neighborhood
SELECT NEIGHBOURHOOD, NAME, MAX(REVIEW) AS MaxReview
FROM nomnom
GROUP BY NEIGHBOURHOOD;

-- List restaurants sorted by price (from low to high) and then by review (high to low) within each price tier
SELECT * FROM nomnom
ORDER BY 
    CASE PRICE
        WHEN '$' THEN 1
        WHEN '$$' THEN 2
        WHEN '$$$' THEN 3
    END, 
    REVIEW DESC;

-- Find all restaurants with 'A' health rating and cuisine other than 'American'
SELECT * FROM nomnom WHERE HEALTH = 'A' AND CUISINE != 'American';

-- Display the neighborhoods with the most number of restaurants, in descending order
SELECT NEIGHBOURHOOD, COUNT(*) AS RestaurantCount
FROM nomnom
GROUP BY NEIGHBOURHOOD
ORDER BY RestaurantCount DESC;

-- Calculate the average review score for each cuisine type
SELECT CUISINE, AVG(REVIEW) AS AverageReview
FROM nomnom
GROUP BY CUISINE
ORDER BY AverageReview DESC;

-- List all restaurants with a review lower than 4.0 and health rating of 'C'
SELECT * FROM nomnom WHERE REVIEW < 4.0 AND HEALTH = 'C';
