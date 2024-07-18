select * from pizza_sales
select sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales;
select sum(quantity) as total_Pizza_sold from pizza_sales;
select count(distinct order_id) as Total_orders from pizza_sales;
select CAST(CAST(sum(quantity) AS DECIMAL(10,2)) /CAST(count(distinct order_id) AS decimal(10,2)) AS decimal(10,2)) AS Avg_pizzas_per_order from pizza_sales;
select DATENAME(DW,order_date) as order_day,count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(DW,order_date) ;

select DATENAME(Month,order_date) as Month_Name ,count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(Month,order_date)
order by total_orders desc;

select pizza_category,sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)=1) as PCT from pizza_sales
where month(order_date)=1
group by pizza_category;

select pizza_size,cast(sum(total_price)as decimal(10,2)) as total_sales,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_size
order by pct desc;

select top 5 pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by sum(total_price) desc;

select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc;

select top 5 pizza_name,sum(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc;

select top 5 pizza_name,sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by sum(total_price) asc;

select top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc;

select top 5 pizza_name,sum(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders asc;













