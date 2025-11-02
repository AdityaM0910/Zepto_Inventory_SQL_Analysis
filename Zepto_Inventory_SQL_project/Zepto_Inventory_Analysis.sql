drop table if exists Zepto ;

create table Zepto (
sku_id Serial Primary key,
category varchar(120),
name varchar(150) Not null,
mrp Numeric(8,2),
discountedPercentage Numeric(8,2),
availableQuantity Integer,
discountedSellingPrice Numeric(8,2),
weightsInGms Integer,
outOfStock Boolean,
quantity Integer
);

----------------------------DATA ---------------------EXPLORATION-------------------------------------------------------------

1--checking no. of rows 
select count(*) from Zepto;

2--inventory data sample
select * from Zepto 
limit 10;

3--checking null names (no null values)
select * from Zepto
where name IS NULL 
OR
category  IS NULL 
OR
mrp IS NULL 
OR
discountedPercentage IS NULL 
OR
availableQuantity IS NULL 
OR
discountedSellingPrice IS NULL 
OR
weightsInGms IS NULL 
OR
outOFStock IS NULL 
OR
quantity IS NULL ;

4--distinct categories of product (14)
Select distinct category
From Zepto
Order By category;

5--products in stock(3279) and out of stock(453)
Select outOFStock, count(sku_id)
from Zepto
Group BY outOFStock;

6--product names used for multiple times
select name, count(sku_id) as "number of SKUs"
from Zepto
Group By name
having count(sku_id) > 1
Order by count(sku_id) DESC;

7--average mrp of products
Select
Round(avg(mrp),2) as avg_mrp,
Round(min(mrp),2) as min_mrp,
Round(max(mrp),2) as max_mrp
from Zepto;

8--average discountedPercentage
Select
Round(avg(discountedPercentage),2) as avg_dis_per
From Zepto;

9--category with highest average discount
select
	category,
	Round(AVG(discountedPercentage), 2) as avg_discount_percentage
From Zepto
Group By category
order by avg_discount_percentage DESC
limit 1;

10--category with most products
Select
	category,
	count(*) as total_products
from Zepto
group By category
order by total_products DESC
limit 1;

11--total available stock in each category
select 
	category,
	SUM(availableQuantity) as total_avail_stock
From Zepto
group by category
order by total_avail_stock DESC;

12--invetory value of each category 
-- inv_val = discountedSellingPrice * AvailableQuantity

Select 
	category,
	ROUND(SUM((discountedSellingPrice * availableQuantity)/100), 2) as totalInventoryPriceInRupee
From Zepto
group by category
order by totalInventoryPriceInRupee DESC;

13--total loss in revenue due to discounts

Select 
	ROUND(SUM(((mrp - discountedSellingPrice) * availableQuantity)/100), 2) as discountLossInRupees
From Zepto;

14-- top 5 categories contributing in inventory value
Select
	category,
	ROUND(SUM((discountedSellingprice * quantity)/100), 2) as totalInventoryValue
From Zepto
group By category
order by totalInventoryValue DESC
limit 5;


15-- category with best discount 
--mrp is 0 in 1 row 
Select 
	category,
	ROUND(AVG((mrp - discountedSellingPrice)/ NULLIF(mrp,0) * 100), 2) AS avgEffectiveDiscountpercent
From Zepto
Group by category
order by avgEffectiveDiscountpercent DESC;


--------------------------------------------DATA ----- CLEANING----------------------------------------------------------------

-- product with mrp 0
Select * From Zepto 
where mrp = 0 OR discountedSellingPrice = 0;

-- row no. 3607 is the culprit
-- now we delete that row
Delete From Zepto
where mrp = 0;

--converting prices into Rupees from paise
update Zepto 
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

-- to check
select mrp , name , discountedSellingPrice FROM Zepto;

-----------------------------BUSINESS--INSIGHTS--FROM--DATA------------------------------------------------------------------

-1----top 10 highest selling categories
Select 
	category,
	ROUND(SUM(mrp * availableQuantity), 2) AS totalInventoryValue
From Zepto
group by category
order by totalInventoryValue Desc
limit 10;

-2----category with highest average discount percentage
Select 
	category,
	ROUND(AVG(discountedPercentage), 2) AS averageDiscountPercent
From Zepto
Group By category
Order By averageDiscountPercent DESC
limit 1;

-3----category with stock less than 200
Select
	category,
	SUM(availableQuantity) AS totalStock
From Zepto
Group By category 
Having SUM(availableQuantity) < 200
Order By totalStock ASC;

-4---category with highest number of unique products
SELECT 
	category,
	Count(DISTINCT name) AS uniqueProducts
From Zepto
Group By category
Order By uniqueProducts DESC
Limit 5;

-5----lowStock high value categories
select
	category,
	SUM(availableQuantity) as totalQuantity,
	ROUND(SUM(mrp * availableQuantity), 2) AS totalValue
From Zepto
Group by category
Having SUM(availableQuantity) <600
ORDER by totalValue DESC;

-6---Products that are causing maximum revenue loss due to discounts
Select
	name,
	category,
	ROUND((mrp * availableQuantity) - ((mrp - ( mrp * discountedpercentage)) * availableQuantity), 2) AS revenueLoss
From Zepto
order by revenueLoss DESC
limit 10;

-7---which category have highest SP after discountpercentage(average)
Select
	category,
	ROUND(AVG(mrp - (mrp - discountedPercentage)), 2) AS averageSP
From Zepto
Group by category
order by averageSP DESC;


--8-- products with high discount and low availableQuantity in stock
Select 
	category,
	name,
	discountedpercentage,
	availableQuantity
From Zepto
where discountedPercentage > 20 AND availableQuantity < 400
Order By discountedPercentage DESC;
