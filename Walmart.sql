show databases;
Create database walmart_db;
show databases;

use walmart_db;
show tables;

select * from walmart limit 10;
select count(*) from walmart;


-- Q1: Find different payment methods, number of transactions, and quantity sold by payment method 
select payment_method, count(*) as no_of_payments
from walmart
group by payment_method;

-- q2 Identify the highest-rated category in each branch. Display the branch, category, and avg rating
select count(distinct branch) from walmart;

select branch, category, avg_rating 
from (select branch, 
			category, 
            avg(rating) as avg_rating,
			rank() over(partition by branch order by avg(rating) desc) as rank_list
	from walmart
	group by 1,2) as ranked
where rank_list = 1;


-- q3 Identify the busiest day for each branch based on the number of transactions
select branch, day_name, no_transactions
from (
    select 
        branch,
        dayname(str_to_date(date, '%d/%m/%Y')) as day_name,
        count(*) as no_transactions,
        rank() over(partition by branch order by count(*) desc) as ranks
    from walmart
    group by branch, day_name
) as ranked
where ranks = 1;


-- q4 Calculate the total quantity of items sold per payment method
select payment_method, sum(quantity) as no_qty_sold
from walmart
group by payment_method;


-- q5 Determine the average, minimum, and maximum rating of categories for each city
 select city, category, min(rating) as min_rating, max(rating) as max_rating, avg(rating) as avg_rating
 from walmart
 group by 1,2;


-- q6 Calculate the total profit for each category
select * from walmart;
select category, sum(total_price * profit_margin) as total_profit
from walmart
group by 1
order by sum(total_price) desc;


-- q7 Determine the most common payment method for each branch
with tab
as
(select branch, payment_method, count(*) as total_trans,
rank() over(partition by branch order by count(*) desc) as ranked
from walmart
group by 1,2)
select branch, payment_method as most_used
from tab
where ranked = 1;


-- q8 Categorize sales into Morning, Afternoon, and Evening shifts
select branch,
case 
	when hour(time) < 12 then 'Morning'
	when hour(time) between 12 and 17 then 'Afternoon'
	else 'Evening'
end as shift,
count(*) as num_invoices
from walmart
group by 1,2
order by 1,3 desc;


-- q9 Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
with revenue_2022
as
(select branch,
	sum(total_price) as revenue 
	from walmart
	where year(date) = 2022
	group by 1
),
revenue_2023
as
(select branch,
	sum(total_price) as revenue 
	from walmart
	where year(date) = 2023
	group by 1
)
select 
    r2022.branch,
    r2022.revenue as last_year_revenue,
    r2023.revenue as current_year_revenue,
    round(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) as revenue_decrease_ratio
from revenue_2022 as r2022
join revenue_2023 as r2023 
on r2022.branch = r2023.branch
where r2022.revenue > r2023.revenue
order by 4 desc
LIMIT 5;
    
 