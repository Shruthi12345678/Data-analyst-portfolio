-- Data Preview
select * from Swiggy_Data;

-- Data Validation and Cleaning

-- Null Check

select
	sum(case when State is null then 1 else 0 end) as null_state,
	sum(case when City is null then 1 else 0 end) as null_city,
	sum(case when Order_Date is null then 1 else 0 end) as null_date,
	sum(case when Restaurant_Name is null then 1 else 0 end) as null_restaurant,
	sum(case when Location is null then 1 else 0 end) as null_location,
	sum(case when Category is null then 1 else 0 end) as null_category,
	sum(case when Dish_name is null then 1 else 0 end) as null_dish,
	sum(case when Price_INR is null then 1 else 0 end) as null_price,
	sum(case when Rating is null then 1 else 0 end) as null_rating,
	sum(case when Rating_Count is null then 1 else 0 end) as null_rating_count
from Swiggy_Data;


-- Blank/Empty String Check
select * 
from Swiggy_Data
where State='' or City='' or Restaurant_Name='' or Location='' or Category='' or Dish_Name='';

--Duplicate Detection
select
	State, City, Order_Date, Restaurant_Name, Location, Category, Dish_Name, Price_INR, Rating, Rating_Count, count(*) as cnt
from Swiggy_Data
group by 
	State, City, Order_Date, Restaurant_Name, Location, Category, Dish_Name, Price_INR, Rating, Rating_Count
having
	count(*) > 1;


-- Duplicate Deletion
with cte as
(
	select *, ROW_NUMBER() over (partition by State, City, Order_Date, Restaurant_Name, Location,
	Category, Dish_Name, Price_INR, Rating, Rating_Count order by (select null)) as rn
	from Swiggy_Data
)
delete from cte where rn > 1;



-- Dimensional Modeling

--CREATING SCHEMA
-- DIMENSION TABLES
-- DATE TABLE

create table dim_date (
	date_id int identity(1,1) primary key,
	Full_Date date,
	Year int,
	Month int,
	Month_Name varchar(20),
	Quarter int,
	Day int,
	Week int
	);

-- Location Table
create table dim_location (
	location_id int identity(1,1) primary key,
	State varchar(100),
	City varchar(100),
	Location varchar(200)
);


--Restaurant Table
create table dim_restaurant(
	restaurant_id int identity(1,1) primary key,
	Restaurant_Name varchar(200)
);


--Category Table
create table dim_category(
	category_id int identity(1,1) primary key,
	Category varchar(200)
);


--Dish Table
create table dim_dish(
	dish_id int identity(1,1) primary key,
	Dish_Name varchar(200)
);


--Fact Table
create table fact_swiggy_orders(
	order_id int identity(1,1) primary key,

	date_id int,
	Price_INR decimal(10,2),
	Rating decimal(4,2),
	Rating_Count int,

	location_id int,
	restaurant_id int,
	category_id int,
	dish_id int,

	Foreign key(date_id) references dim_date(date_id),
	Foreign key(location_id) references dim_location(location_id),
	Foreign key(restaurant_id) references dim_restaurant(restaurant_id),
	Foreign key(category_id) references dim_category(category_id),
	Foreign key(dish_id) references dim_dish(dish_id)
);

select * from fact_swiggy_orders;

--Insert data in Tables

--dim date
insert into dim_date(Full_Date, Year, Month, Month_Name, Quarter, Day, Week)
select distinct
	Order_Date,
	YEAR(Order_Date),
	MONTH(Order_Date),
	DATENAME(Month, Order_Date),
	DATEPART(QUARTER, Order_Date),
	DAY(Order_Date),
	DATEPART(WEEK, Order_Date)
FROM Swiggy_Data
where Order_Date is not null;

select * from dim_date;

--dim location

INSERT INTO dim_location(State, City, Location)
select distinct
	State, 
	City, 
	Location
from Swiggy_Data;

select * from dim_location;


-- dim Restaurant 
INSERT INTO dim_restaurant(Restaurant_Name)
select distinct	
	Restaurant_name 
from Swiggy_Data;

select * from dim_restaurant;

-- dim category 
INSERT INTO dim_category(Category)
select distinct 
	Category 
from Swiggy_Data;

-- dim dish
INSERT INTO dim_dish(Dish_Name)
select distinct 
	Dish_Name 
from Swiggy_Data;

-- Fact Table

insert into fact_swiggy_orders
(
	date_id,
	Price_INR,
	Rating,
	Rating_Count,
	location_id,
	restaurant_id,
	category_id,
	dish_id
)
select
	dd.date_id,
	s.Price_INR,
	s.Rating,
	s.Rating_Count,

	dl.location_id,
	dr.restaurant_id,
	dc.category_id,
	dsh.dish_id
from Swiggy_Data s
join dim_date dd 
	on dd.Full_Date = s.Order_Date

join dim_location dl 
	on dl.State = s.State
	and dl.City = S.City
	and dl.Location = S.Location

join dim_restaurant dr 
	on dr.Restaurant_Name = s.Restaurant_Name

join dim_category dc 
	on dc.Category = s.Category 

join dim_dish dsh 
	on dsh.Dish_Name = s.Dish_Name;


select * from fact_swiggy_orders;

-- Join Tables
select * from fact_swiggy_orders f 
join dim_date d on f.date_id = d.date_id
join dim_location l on f.location_id = l.location_id
join dim_restaurant r on f.restaurant_id = r.restaurant_id
join dim_category c on f.category_id = c.category_id
join dim_dish di on f.dish_id = di.dish_id;


--KPI's

--TOTAL ORDERS
SELECT count(*) as Total_Orders
from fact_swiggy_orders;


--Total Revenue (In Million)
SELECT
FORMAT(SUM(CONVERT(FLOAT,price_INR))/1000000, 'N2') + 'INR Million'
as Total_Revenue
from fact_swiggy_orders;


--Average Dish Price
SELECT
FORMAT(AVG(CONVERT(FLOAT, price_INR)), 'N2') + 'INR'
as Total_Revenue
from fact_swiggy_orders;


--Average Rating
SELECT
AVG(Rating) as Avg_Rating
from fact_swiggy_orders;



--Deep-Dive Business Analysis

--Monthly Order Trends
select 
	d.Year,
	d.Month,
	d.Month_Name,
	count(*) as Total_Orders
from fact_swiggy_orders f
join dim_date d
	on f.date_id = d.date_id
group by d.Year, d.Month, d.Month_Name
order by 4 desc;


select 
	d.Year,
	d.Month,
	d.Month_Name,
	sum(price_INR) as Total_Revenue
from fact_swiggy_orders f
join dim_date d
	on f.date_id = d.date_id
group by d.Year, d.Month, d.Month_Name
order by 4 desc;


-- Quarterly Trend

select
	d.Year, 
	d.Quarter,
	count(*) as Total_Orders
from fact_swiggy_orders f
join dim_date d
	on f.date_id = d.date_id
group by
	d.Year, d.Quarter
order by 3 desc;

select
	d.Year, 
	d.Quarter,
	sum(Price_INR) as Total_Revenue
from fact_swiggy_orders f
join dim_date d
	on f.date_id = d.date_id
group by
	d.Year, d.Quarter
order by 3 desc;



--Yearly Trend

select
	d.Year,
	count(*) as Total_Orders
from fact_swiggy_orders f 
join dim_date d 
	on f.date_id = d.date_id
group by d.Year
order by 2 desc;


select
	d.Year,
	sum(price_INR) as Total_Revenue
from fact_swiggy_orders f 
join dim_date d 
	on f.date_id = d.date_id
group by d.Year
order by 2 desc;

--Orders by Day of Week (Mon - Sun)
select
	DATENAME(WEEKDAY, d.Full_Date) as day_name,
	count(*) as Total_Orders
from fact_swiggy_orders f 
join dim_date d 
	on f.date_id = d.date_id
group by DATENAME(WEEKDAY, d.Full_Date)
order by 2 desc;

select
	DATENAME(WEEKDAY, d.Full_Date) as day_name,
	sum(price_INR) as Total_Revenue
from fact_swiggy_orders f 
join dim_date d 
	on f.date_id = d.date_id
group by DATENAME(WEEKDAY, d.Full_Date)
order by 2 desc;


--Top 10 Cities by Order Volume
select Top 10
	l.City,
	count(*) as Total_Orders
from fact_swiggy_orders f
join dim_location l 
	on f.location_id = l.location_id
group by l.City
order by 2 desc;

select Top 10
	l.City,
	sum(price_INR) as Total_Revenue
from fact_swiggy_orders f
join dim_location l 
	on f.location_id = l.location_id
group by l.City
order by 2 desc;


-- Revenue Contribution by State
select
	l.State,
	sum(price_INR) as Total_Revenue
from fact_swiggy_orders f
join dim_location l 
	on f.location_id = l.location_id
group by l.state
order by 2 desc;


-- Food Performance

--Top 10 Restaurants by Orders
select Top 10
	r.Restaurant_Name,
	count(*) as Total_Orders
from fact_swiggy_orders f 
join dim_restaurant r 
	on f.restaurant_id = r.restaurant_id
group by r.Restaurant_Name
order by 2 desc;

select Top 10
	r.Restaurant_Name,
	sum(Price_INR) as Total_Orders
from fact_swiggy_orders f 
join dim_restaurant r 
	on f.restaurant_id = r.restaurant_id
group by r.Restaurant_Name
order by 2 desc;


-- Top Categories by Order Volume

select Top 10
	c.Category,
	count(*) as Total_Orders
from fact_swiggy_orders f 
join dim_category c 
	on f.category_id = c.category_id
group by c.Category
order by 2 desc;

select Top 10
	c.Category,
	sum(Price_INR) as Total_Revenue
from fact_swiggy_orders f 
join dim_category c 
	on f.category_id = c.category_id
group by c.Category
order by 2 desc;


--Most Ordered Dishes
select
	d.Dish_Name,
	count(*) as Total_Orders
from fact_swiggy_orders f 
join dim_dish d 
	on f.dish_id = d.dish_id
group by d.Dish_Name
order by 2 desc;



--Cuisine Performance (Orders + Avg_Rating)
select
	c.category,
	count(*) as total_orders,
	avg(convert(float, f.rating)) as avg_rating
from fact_swiggy_orders f
join dim_category c
	on f.category_id = c.category_id
group by c.Category
order by total_orders desc;



-- Customer Spending Insights

select
	case
		when convert(float, price_INR) < 100 then 'Under 100'
		when convert(float, Price_INR) between 100 and 199 then '100 - 199'
		when convert(float, Price_INR) between 200 and 299 then '200 - 299'
		when convert(float, Price_INR) between 300 and 499 then '300 - 499'
		else '500+'
	end as price_Range,
	count(*) as Total_Orders
from fact_swiggy_orders
group by
	case
		when convert(float, price_INR) < 100 then 'Under 100'
		when convert(float, Price_INR) between 100 and 199 then '100 - 199'
		when convert(float, Price_INR) between 200 and 299 then '200 - 299'
		when convert(float, Price_INR) between 300 and 499 then '300 - 499'
		else '500+'
	end
order by Total_Orders desc;
	



	


select * from fact_swiggy_orders;
select * from dim_dish















