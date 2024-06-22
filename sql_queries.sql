SELECT count(*) as cnt,order_status from orders group by order_status;
-- selecting total count in orders
SELECT count(*) as cnt from orders;
--selecting 10 orders
SELECT * from orders limit 10;
--Extracting Data - substr and split
select substr('2013-07-25 00:00:00.0',6,2) as result
select order_id,substr(order_date, 1, 10) as order_date,order_customer_id,order_status from orders;
--Projecting data
select * from orders limit 10;
select order_customer_id,date_format(order_date,'yyyy-MM') as order_month,order_status from orders limit 10
select distinct order_id from orders
select distinct *  from orders limit 10

--Filtering Data
select * from orders where order_status = 'COMPLETE' limit 10
select * from orders where order_status = 'COMPLETE' OR ORDER_status = 'PENDING' limit 10
select count(*) AS CNT from orders where order_status = 'COMPLETE'
select * from orders where order_status in ('COMPLETE','CLOSED') limit 10
select count(*) AS CNT from orders where order_status = 'COMPLETE' or order_status = 'CLOSED'

SELECT * FROM orders
WHERE order_status IN ('COMPLETE', 'CLOSED')
    AND date_format(order_date, 'yyyy-MM') = '2014-01'
LIMIT 10

SELECT count(1) FROM orders
WHERE order_status IN ('COMPLETE', 'CLOSED')
    AND date_format(order_date, 'yyyy-MM') = '2014-01'

--Joining Tables -Inner
--There are different types of joins
--INNER JOIN - Get all the records from both the datasets which satisfies JOIN condition.
--OUTER JOIN - We will get into the details as part of the next topic
--Example for INNER JOIN
  SELECT o.order_id,
      o.order_date,
      o.order_status,
      oi.order_item_subtotal
  FROM orders o JOIN order_items oi
      ON o.order_id = oi.order_item_order_id
  LIMIT 10
  We can join more than 2 tables in one query. Here is how it will look like.
  SELECT o.order_id,
      o.order_date,
      o.order_status,
      oi.order_item_subtotal
  FROM orders o JOIN order_items oi
      ON o.order_id = oi.order_item_order_id
      JOIN products p
      ON p.product_id = oi.order_item_product_id
  LIMIT 10


select count(*) from orders o join order_items oi on o.order_id=oi.order_item_order_id

select o.order_id,
o.order_date,
o.order_status,
oi.order_item_subtotal
from orders o join order_items oi
on o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE','CLOSED')
limit 10

SELECT count(1)
FROM orders o JOIN order_items oi
    ON o.order_id = oi.order_item_order_id
WHERE o.order_status IN ('COMPLETE', 'CLOSED')
LIMIT 10

SELECT o.order_id,
    o.order_date,
    o.order_status,
    oi.order_item_subtotal
FROM orders o JOIN order_items oi
    ON o.order_id = oi.order_item_order_id
WHERE o.order_status IN ('COMPLETE', 'CLOSED')
    AND date_format(order_date, 'yyyy-MM') = '2014-01'
LIMIT 10


SELECT count(1)
FROM orders o JOIN order_items oi
    ON o.order_id = oi.order_item_order_id
WHERE o.order_status IN ('COMPLETE', 'CLOSED')
    AND date_format(order_date, 'yyyy-MM') = '2014-01'
LIMIT 10