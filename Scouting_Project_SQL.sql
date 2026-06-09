--CREATE DATABASE Football_Scouting;

SELECT T1.player_id,
	   T1.player_name,
	   T1.player_club_id,
	   T2.name AS 'Club_Name',
	   SUM(T1.goals) AS 'Total_Goals',
	   SUM(T1.assists) AS 'Total_Assists',
	   SUM(T1.minutes_played) AS 'Total_Minutes',
	   SUM(T1.minutes_played) / NULLIF(SUM(T1.goals) + SUM(T1.assists) , 0) AS 'Goal_Involvement_Per_Minutes'
FROM appearances AS T1
JOIN clubs AS T2
ON T1.player_club_id = T2.club_id
WHERE 1=1
AND (
    (YEAR(date) = 2024 AND MONTH(date) >= 8) 
    OR 
    (YEAR(date) = 2025 AND MONTH(date) <= 7)
)
GROUP BY player_id , player_name , T2.name ,  player_club_id
HAVING SUM(T1.minutes_played) > 500
ORDER BY player_id ;


WITH ValuationsWithLag AS (
    SELECT 
        T1.player_id,
        T2.name AS Full_Name,
        T1.date AS Valuation_Date,
        T1.market_value_in_eur AS Value_In_Euro,
        LAG(T1.market_value_in_eur, 1, 0) OVER(PARTITION BY T1.player_id ORDER BY T1.date ASC) AS Last_Value
    FROM valuations AS T1
    JOIN players AS T2 ON T1.player_id = T2.player_id
)
SELECT player_id,
	   Full_Name,
	   Valuation_Date,
	   Value_In_Euro,
	   Last_Value,
	   (Value_In_Euro - Last_Value) AS Value_Change
FROM ValuationsWithLag
WHERE 1=1
AND YEAR(Valuation_Date) > 2024
ORDER BY player_id ASC, Valuation_Date ASC;


SELECT T2.player_id,
	   T2.name AS player_name,
	   T2.position,T2.sub_position,
	   T2.market_value_in_eur AS player_market_value,
	   T3.name AS current_club_name,
	   T4.name AS league_name,
	   T4.country_name AS league_country,
	   SUM(T1.goals) AS season_goals,
	   SUM(T1.assists) AS season_assists,
	   SUM(T1.minutes_played) AS season_minutes
FROM appearances T1
JOIN Players AS T2
ON T1.player_id = T2.player_id
JOIN clubs AS T3
ON T2.current_club_id = T3.club_id
JOIN competitions T4 ON T1.competition_id = T4.competition_id
WHERE 1=1
AND (
    (YEAR(T1.date) = 2024 AND MONTH(T1.date) >= 8) 
    OR 
    (YEAR(T1.date) = 2025 AND MONTH(T1.date) <= 7)
)
AND T2.market_value_in_eur BETWEEN 500000 AND 1000000
AND T2.position = 'Attack'
GROUP BY T2.player_id, T2.name, T2.position, T2.sub_position, T2.market_value_in_eur, T3.name, T4.name, T4.country_name
HAVING SUM(T1.goals) >= 5
ORDER BY T2.player_id ASC;