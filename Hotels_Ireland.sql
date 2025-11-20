-- Create DataBase
CREATE DATABASE Hotels_Ireland;


USE Hotels_Ireland;
GO


 -- Check row count

SELECT COUNT(*) AS TotalRows FROM hotels;

-- First 10 Rows of the Table

SELECT TOP 10 * FROM hotels;
/*
1 - Top Rated Hotels: Which hotels have the highest scores?
*/

SELECT TOP 10 hotel_name, city, ROUND(score,2)
FROM hotels
ORDER BY score DESC;



/*
2 - Average Score by City: Identify cities with the highest average hotel scores.
*/

WITH CityScores AS (
	SELECT city, ROUND(AVG(score),2) AS avg_score
	FROM hotels
	GROUP BY city
)

SELECT city, avg_score
FROM CityScores
ORDER BY avg_score DESC;



/*
3 - Top 5 Hotels by Score and Review Count: List the top 5 hotels based on a combination of score and review count.
*/

WITH RankHotels AS (
	SELECT hotel_name, city, score, reviews,
			ROW_NUMBER() OVER (ORDER BY score DESC, reviews DESC) AS rank
	FROM hotels
)

SELECT hotel_name, city, score, reviews
FROM RankHotels
WHERE rank <= 5;

/*
4 - Hotels with Free Cancellation and High Scores: Find high-scoring hotels that offer free cancellation.
*/

WITH FreeCancellationHotels AS (
	SELECT hotel_name, city, ROUND(score,2) as score
	FROM hotels
	WHERE Free_cancellation = 'Free cancellation'
)

SELECT *
FROM FreeCancellationHotels
ORDER BY score DESC;

/*
5 - Price Range Analysis: Analyze the price range for hotels in each city.
*/

WITH CityPrice AS (
	SELECT city, MIN(price) AS min_price, MAX(price) AS max_price, ROUND(AVG(price),2) AS avg_price
	FROM hotels
	GROUP BY city
)

SELECT * , (max_price - min_price) AS diff_price
FROM CityPrice
ORDER BY diff_price DESC, avg_price DESC;

/*
6 - Room Availability by City: Determine cities with the highest average number of rooms left.
*/

WITH CityAvailability AS (
	SELECT city, AVG(rooms_left) AS avg_rooms_left
	FROM hotels
	GROUP BY city
)

SELECT *
FROM CityAvailability
ORDER BY avg_rooms_left DESC;

/*
7 - Review Rate Distribution: Show the distribution of hotels across different review rates.
*/

WITH ReviewRateDistribution AS (
	SELECT review_rate, COUNT(*) AS count_rate
	FROM hotels
	GROUP BY review_rate
)

SELECT *
FROM ReviewRateDistribution
ORDER BY count_rate DESC;


/* 8 — Most Popular Hotels (High Score + High Reviews) */
SELECT 
    hotel_name,
    city,
    score,
    reviews,
    ROUND((score * LOG10(reviews + 10)), 2) AS popularity_index
FROM hotels
WHERE reviews > 0
ORDER BY popularity_index DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


/*
9 - Impact of Review Count on Score: Determine if there's a correlation between the number of reviews and the average score.
*/

WITH ReviewRanges AS (
    SELECT 
        CASE 
            WHEN reviews BETWEEN 0 AND 1000 THEN '0-1000'
            WHEN reviews BETWEEN 1001 AND 5000 THEN '1001-5000'
            WHEN reviews BETWEEN 5001 AND 10000 THEN '5001-10000'
            WHEN reviews BETWEEN 10001 AND 20000 THEN '10001-20000'
            WHEN reviews > 20000 THEN '20001+'
        END AS review_range,
        score
    FROM hotels
),
ReviewScoreCorrelation AS (
    SELECT 
        review_range,
        AVG(score) AS avg_score,
        COUNT(*) AS hotel_count
    FROM ReviewRanges
    GROUP BY review_range
)
SELECT review_range, avg_score, hotel_count
FROM ReviewScoreCorrelation
ORDER BY review_range;


