SELECT *
FROM
BRIGHT_COFFEE;


--Exploratory Data Analysis--

-- Checking the number of coffee stores

select distinct store_location
from bright_coffee;

--Checking the number of product categories
select distinct product_category
from bright_coffee;

---------------------------------------------------------------------------------------------

--checking the number of product types

select distinct product_type
from
bright_coffee;

---------------------------------------------------------------------------------------------
--Checking product detail

select distinct product_detail
from
bright_coffee;

---------------------------------------------------------------------------------------------

--Date & Time Functions
--Checking the earliest transaction date
select MIN(transaction_date) AS first_operating_date
from bright_coffee;
---------------------------------------------------------------------------------------------
--Checking the earliest transaction time
select MAX(transaction_date) AS last_operating_time
from bright_coffee;

---------------------------------------------------------------------------------------------

--Checking the earliest transaction time
select MIN(transaction_time) AS first_operating_time
from bright_coffee;
---------------------------------------------------------------------------------------------
--Checking the earliest transaction time
select MAX(transaction_time) AS last_operating_time
from bright_coffee;

---------------------------------------------------------------------------------------------

select transaction_date,
dayname(transaction_date) AS day_name
from bright_coffee;
---------------------------------------------------------------------------------------------
select transaction_date,
dayname(transaction_date) AS day_name,
case

    when dayname(transaction_date) IN ('Sat',' Sun') THEN 'weekend'
    else 'weekday'
    END AS day_classification,
    MONTHNAME(transaction_date)AS month_name,
   -- transaction_time,
    case
       
       when transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
       when transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
       when transaction_time >= '17:00:00' THEN 'Evening'
       END AS time_bucket,
       HOUR(transaction_time) AS hour_of_day,
       store_location,
       product_category,
       product_detail,
       product_type,
       --unit_price,
       --transaction_qty,
       count (distinct transaction_id)AS number_of_sales,
       sum (transaction_qty*unit_price) AS Revenue
from bright_coffee
GROUP BY ALL;




