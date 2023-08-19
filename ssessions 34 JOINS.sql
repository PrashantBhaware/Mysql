# cross join cartesian product
SELECT * FROM sql_cx_live.useres t1 
CROSS JOIN sql_cx_live.groups t2;

# inner join
SELECT * FROM sql_cx_live.membership t1
INNER JOIN sql_cx_live.useres t2
ON t1.user_id = t2.user_id; 

# left outer join
SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.useres t2
ON t1.user_id = t2.user_id; 

-- sql operations unio union all intersect and except or minus
SELECT * FROM sql_cx_live.person1
UNION
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person1
UNION ALL
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person1
INTERSECT
SELECT * FROM sql_cx_live.person2;

SELECT * FROM sql_cx_live.person1
EXCEPT
SELECT * FROM sql_cx_live.person2 ;

# full outer join
SELECT * from sql_cx_live.membership t1
left join sql_cx_live.useres t2
on t1.user_id = t2.user_id 
UNION 
SELECT * from sql_cx_live.membership t1
right join sql_cx_live.useres t2
on t1.user_id = t2.user_id ;

# Joining on the basis of two tables
SELECT * FROM sql_cx_live.students t1
JOIN sql_cx_live.class t2
ON t1.class_id = t2.class_id AND t1.enrollment_year = t2.class_year;

SELECT * FROM flipkart.order_details t1
join flipkart.orders  t2
on  t1.order_id = t2.order_id 
join flipkart.users t3
on t2.user_id = t3.user_id;

# find order_id , name and city by joining users and orders
select t1.order_id , t2.name, t2.city
from flipkart.orders t1
join flipkart.users t2
on t1.user_id = t2.user_id;

# find order_id product_category by joing order_details and category
select t2.order_id,t1.vertical
 from flipkart.category t1
join flipkart.order_details t2
on t1.category_id = t2.category_id;

#find all the orders placed in pune
select * from flipkart.orders t1
join flipkart.users t2
on t1.user_id=t2.user_id
where t2.city='pune';

# find all orders under chair category
select * from flipkart.category t1 
join flipkart.order_details t2
on t1.category_id = t2.category_id
where vertical = 'chairs';

# find all profitable orders
select t1.order_id, sum(t2.profit) 
from flipkart.orders t1
join flipkart.order_details t2
on t1.order_id = t2.order_id
group by t1.order_id
having sum(t2.profit) > 0;

# find the customer who has maximum no of orders
SELECT NAME,count(*) as 'no_of_orders' FROM flipkart.orders t1
JOIN flipkart.users t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY no_of_orders DESC;

# which is the most profitable category
SELECT t2.vertical,SUM(profit) FROM flipkart.order_details t1
JOIN flipkart.category t2
on t1.category_id= t2.category_id
group by t2.vertical 
order by SUM(profit) desc limit 1;

# which is most profitable state
SELECT state,sum(profit) FROM flipkart.orders t1
JOIN flipkart.order_details t2
on t1.order_id= t2.order_id
join flipkart.users t3
on t1.user_id=t3.user_id
group by state 
order by sum(profit) desc;

# find all categories with profit higher than 3000
SELECT t2.vertical,SUM(profit) FROM flipkart.order_details t1
JOIN flipkart.category t2
on t1.category_id= t2.category_id
group by t2.vertical 
having sum(profit) > 3000;


