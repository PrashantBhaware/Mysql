# SAMSUNG PHONE WITH BIGGEST SCREEN SIZE
SELECT model, screen_size FROM campusx.smartphones WHERE brand_name='samsung'
ORDER BY screen_size  DESC LIMIT 20;

# SORT ALL THE PHONES IN DESCENDING ORDER OF NO OF TOTAL CAMERAS
SELECT model, num_front_cameras + num_rear_cameras as 'total_cameras' 
FROM campusx.smartphones
ORDER BY total_cameras DESC;

#sort data on the basis of ppi in decreasing order
SELECT model,
round(sqrt((resolution_width*resolution_width + resolution_height*resolution_height)/screen_size)) as 'ppi'
FROM campusx.smartphones order by ppi desc;

#find the phone with 2nd largest battery
SELECT model, battery_capacity FROM campusx.smartphones
ORDER BY battery_capacity desc limit 1,1;

SELECT model, battery_capacity FROM campusx.smartphones
ORDER BY battery_capacity desc limit 10,9;

# find the name and rating of worst rated apple phones
SELECT model,rating from campusx.smartphones where brand_name='apple'
order by rating asc limit 1;

# sorting on the basic of two columnns
 select * from campusx.smartphones
 order by brand_name asc, price asc;
 
  select * from campusx.smartphones
 order by brand_name asc, rating desc;
 
 -- Grouping in sql (GRROUP BY)
-- group smaerphones by brand and get count avg price, max rating ,avg screen size and avg capacity
SELECT brand_name, 
COUNT(*) as 'num_phones',
round(avg(price)) as 'avg_price',
max(rating) as 'max_rating',
round(avg(screen_size),2) as 'avg_screen_size',
avg(battery_capacity) as 'avg_battery_capacity'
FROM campusx.smartphones
group by brand_name
order by num_phones;

-- group smartphones by whether they have an nfc and get the average price and rating

SELECT has_nfc,
round(avg(price)) as 'avg_price',
round(avg(rating)) as 'ratings'
from campusx.smartphones
group by has_nfc;

SELECT has_5g,
round(avg(price)) as 'avg_price',
round(avg(rating)) as 'ratings'
from campusx.smartphones
group by has_5g;

# group smartphones if the extendende memory avaikable and gets the avg price
SELECT extended_memory_available,
round(avg(price)) as 'avg_price',
round(avg(rating)) as 'ratings'
from campusx.smartphones
group by extended_memory_available;

-- group smartphones by the brand and processor brand and get the count of models avg primary camera resolution (rear) 
SELECT brand_name, processor_brand,
COUNT(*) AS 'num_phones',
round(avg(primary_camera_rear)) AS 'avg camera resolution'
from campusx.smartphones 
group by brand_name,processor_brand;

# find top five most costly phones
select brand_name,
avg(price) as 'avg_price'
from campusx.smartphones
group by brand_name
order by avg_price desc limit 5;

# which brand makes a smallest screen smartphones
select brand_name,
avg(screen_size) as 'avg_screen_size'
from campusx.smartphones
group by brand_name
order by avg_screen_size asc ;

-- group smartphones by the brand, and find the brand with the highest no of models that both have nfc and ir blaster
select brand_name ,
count(*) as 'count'
from campusx.smartphones
where has_nfc='True' and has_ir_blaster='True'
group by brand_name
order by count desc; 

#find all samsung 5g enabled smartphones and find out the avg price for nfc and non nfc phones
SELECT has_nfc , avg(price) as 'avg_price'
from campusx.smartphones
where brand_name='samsung'
group by has_nfc;

#find the phone name of costliest phone
select model,price
from campusx.smartphones
order by price desc limit 1;

# find avg price of smartphones brand wich have more than 20 phones

SELECT brand_name, count(*) as 'count',
avg(price) as 'avg_price'
from campusx.smartphones
group by brand_name
having count > 20
order by avg_price desc;

# find avg rating of smartphones brand wich have more than 20 phones
SELECT brand_name, count(*) as 'count',
avg(rating) as 'avg_ratings'
from campusx.smartphones
group by brand_name
having count > 20
order by avg_ratings desc;

# find the top 3 brands with highest avg ram that have a refresh rate of at least 90hz and fast
-- charging availabe and dont consider brands which have less than 10 phones
SELECT brand_name,
avg(ram_capacity) as 'avg_ram'
FROM campusx.smartphones
WHERE refresh_rate > 90 and fast_charging_available = 1
group by brand_name
having count(*) > 10
ORDER BY 'avg_ram' DESC LIMIT 3 ;

-- find the avg price of all the phone brands with avg rating >  70 num_phones more than 10 among all 5g enabled phones
select brand_name,
avg(price) as 'avg_price'
from campusx.smartphones
where has_5g='True'
group by brand_name
having avg(rating) > 70 and count(*) > 10;

## on ipl dataset
-- find top 5 batsman in ipl
SELECT batter ,sum(batsman_run) as runs
from campusx.ipl
group by batter
order by runs desc limit 10

 