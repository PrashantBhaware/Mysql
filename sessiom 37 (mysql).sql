# find top 5 run scorer from every team
use campusx;

SELECT * FROM (
    SELECT BattingTeam,batter,sum(batsman_run) as 'total_runs',
	DENSE_RANK() OVER(partition by BattingTeam order by sum(batsman_run) desc) as 'rank_within_team'
	FROM ipl
	group by BattingTeam, batter
	order by sum(batsman_run) ) t
    
WHERE t.rank_within_team < 6
order by t.BattingTeam , rank_within_team;

# find virat kohli runs after 50,100 and 200 th matches
SELECT * FROM(select CONCAT("Match-",CAST(row_number() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
	SUM(batsman_run) AS 'runs_scored',
	SUM(SUM(batsman_run)) over(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'career_runs'
	from ipl
	where batter= 'V Kohli'
	group by ID) t
WHERE match_no= 'match-50' or match_no= 'match-100' or 
match_no= 'match-200';

# calcualte the cumulative avg of virat kohli for each

SELECT * FROM (SELECT 
CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run) AS 'runs_scored',
SUM(SUM(batsman_run)) OVER w AS 'career_runs',
AVG(SUM(batsman_run)) OVER w AS 'career_avg'
FROM ipl
WHERE batter = 'V Kohli'
GROUP BY ID
WINDOW w AS (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) t;

# RUNNING AVG
SELECT * FROM (SELECT 
CONCAT("Match-",CAST(ROW_NUMBER() OVER(ORDER BY ID) AS CHAR)) AS 'match_no',
SUM(batsman_run) AS 'runs_scored',
SUM(SUM(batsman_run)) OVER w AS 'career_runs',
AVG(SUM(batsman_run)) OVER w AS 'career_avg',
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS 'rolling_avg'
FROM ipl
WHERE batter = 'V Kohli'
GROUP BY ID
WINDOW w AS (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)) t;
 
 # percent of total
 USE zomato;
 
 SELECT f_name,
 (total_value/ sum(total_value) over())*100 as 'percent_of_total'
 FROM (SELECT f_id, sum(amount) as 'total_value' FROM orders t1
 join order_details t2
 ON t1.order_id = t2.order_id
 where r_id = 2
 group by f_id) t
 join food t3
 on t.f_id = t3.f_id
 order by (total_value/ sum(total_value) over())*100 desc;

 ## percentile and quantiles
 USE campusx;
 SELECT * , 
 PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY marks) over(partition by branch) as 'medain_marks'
 FROM marks;
 
# segmenatation
SELECT *,
ntile(3) over(order by marks desc ) as 'buckets'
FROM marks;

SELECT brand_name,model,price,
CASE
	WHEN bucket = 1 THEN 'budget'
    WHEN bucket = 2 THEN 'mid_range'
    WHEN bucket = 3 THEN 'premium'
END AS 'PHONE_TYPE'
FROM(select brand_name,model,price,
     ntile(3) over(ORDER BY price) AS 'bucket'
     from smartphones ) t ;

SELECT *,
CUME_DIST() OVER(ORDER BY marks ASC) AS 'Percentile_score'
FROM MARKS
order by marks desc;

SELECT * FROM (SELECT *,
CUME_DIST() OVER(ORDER BY marks ASC) AS 'Percentile_score'
FROM MARKS
order by marks desc) t
WHERE T.Percentile_score > 0.90;






 
 

 










