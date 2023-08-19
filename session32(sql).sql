SELECT DISTINCT (processor_brand) AS 'All brands'
FROM campusx.smartphones; 

SELECT DISTINCT brand_name, processor_brand
FROM campusx.smartphones; 

-- WHERE how to apply with conditio filtering records 
SELECT * FROM campusx.smartphones
WHERE brand_name='apple';

SELECT * FROM campusx.smartphones
WHERE price > 50000;

-- between
-- SELECT * FROM campusx.smartphones
-- WHERE price >10000 AND price < 20000

SELECT * FROM campusx.smartphones
 WHERE price BETWEEN 10000 AND 20000;
 
 -- FIND PHONES WITH RATING  > 80 AND PRICE <25000
 SELECT * FROM campusx.smartphones
 WHERE price < 25000 AND rating > 80;
 
SELECT * FROM campusx.smartphones
WHERE price < 15000 AND rating > 80 AND  processor_brand = 'snapdragon';

-- find all samsung phones with ram greater than 8gb
SELECT * FROM campusx.smartphones
WHERE brand_name='samsung' AND ram_capacity > 8;

-- find samsung phone with snapdragon processor
SELECT * FROM campusx.smartphones
WHERE brand_name='samsung' AND processor_brand='snapdragon';

-- find brands who sell phone with proce 50000
SELECT DISTINCT(brand_name) FROM campusx.smartphones
WHERE price > 50000;

# IN AND NOT IN

SELECT * FROM campusx.smartphones
WHERE processor_brand= 'snapdragon' OR  processor_brand= 'exynos' 
OR  processor_brand= 'bionic' ;
 
SELECT * FROM campusx.smartphones
WHERE processor_brand IN ('snapdragon','exynos','bionic');
 # NOT IN
SELECT * FROM campusx.smartphones
WHERE processor_brand NOT IN ('snapdragon','exynos','bionic');

-- updatae 
UPDATE campusx.smartphones
SET processor_brand= 'dimencity'
WHERE processor_brand= 'mediatek';

SELECT * FROM campusx.smartphones 
where processor_brand= 'dimencity';

-- updating email and password of ankit

UPDATE  campusx.users
SET email= 'ankit@yahoo.com', password='123456'
WHERE  name= 'ankit';

-- delete
 DELETE  FROM campusx.smartphones
 WHERE price > 200000;
 
 DELETE FROM campusx.smartphones
 WHERE primary_camera_rear > 150 AND brand_name = 'samsung';
 
 -- Aggregate functions
 # MIN(),MAX()
 SELECT MIN(price) FROM campusx.smartphones;
 SELECT MAX(price) FROM campusx.smartphones;

 SELECT MAX(ram_capacity) FROM campusx.smartphones;
 
#find the price of costliest samsung phone
SELECT MAX(price) FROM campusx.smartphones
WHERE brand_name= 'samsung' ;

# to find the above phone the code is
SELECT * FROM campusx.smartphones
WHERE brand_name='samsung' and price=110999;

# AVG()
#find avg ratings of apple phones
SELECT avg(rating) FROM campusx.smartphones
WHERE brand_name='apple';

#find avg ratings of oneplus phones
SELECT avg(rating) FROM campusx.smartphones
WHERE brand_name='oneplus';

-- SUM()
 SELECT SUM(price) from campusx.smartphones;
 
 -- count()
 select count(*) from campusx.smartphones
 where brand_name='realme';
 
 -- COUNT(DISTINCT()) 
 SELECT count(DISTINCT(brand_name)) from campusx.smartphones;
SELECT count(DISTINCT(processor_brand)) from campusx.smartphones;

# std()
 select STD(screen_size) from campusx.smartphones;
 # variance
 select variance(screen_size) from campusx.smartphones

-- SCALER FUNCTIONS
# ABS() ,ROUND() CEIL() ,FLOOR()




