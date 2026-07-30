create database northwind_analytics;
use northwind_analytics;

select * from customers;
select * from orders;
select * from order_details;
select * from products;
select * from categories;

										    # Total Customers Count

select count(*)as total_customers from customers;

                                            
										    # Total Orders Count

select count(*)as total_orders from orders;

                                            
                                            # Total Products Count
                                             
select count(*)as total_products from products;

                                            
                                            # Total Categories Count 
                                            
select count(*)as total_categories from categories;

                                           
                                           # Calculate Total Revenue 
                                            
select round(sum(UnitPrice * Quantity))as total_revenue from order_details;

                                            
                                            # Top 10 Customers by Total Purchase Amount
                                            

select c.CompanyName, round(sum(od.UnitPrice * od.Quantity), 2)as total_purchase from customers c 
join orders o on c.CustomerID = o.CustomerID
join order_details od on o.OrderID = od.OrderID
group by c.CompanyName
order by total_purchase desc 
limit 10;

                                            # Top 10 Selling Products by Quantity
										
select p.productName, sum(od.Quantity)as total_quantity from products p 
join order_details od on p.productID = od.productID
group by p.productName
order by total_quantity desc
limit 10;

                                           # Revenue by Category
                                           
select c.CategoryName, round(sum(od.UnitPrice * od.Quantity), 2)as revenue from Categories c 
join products p on c.CategoryID = p.CategoryID
join order_details od on p.productID = od.ProductID
group by c.CategoryName
order by revenue desc;

                                           
                                           # Average Order Value
                                           
select round(avg(order_total), 2)as avg_order_value 
from (
      select OrderID, sum(UnitPrice * Quantity)as order_total
      from order_details group by OrderID
)as ordervalue;         


                                           # Top 5 categories by revenue
                                           
select c.CategoryName, round(sum(od.UnitPrice * od.Quantity), 2)as revenue from categories c
join products p on c.CategoryID = p.CategoryID
join order_details od on p.ProductID = od.ProductID
group by c.categoryName
order by revenue desc
limit 5;

										 # Monthly Sales Trend
                                         
select month(o.OrderDate)as order_month, year(o.OrderDate)as order_year, round(sum(od.UnitPrice * od.Quantity), 2)as total_revenue from orders o 
join order_details od on o.OrderID = od.OrderID
group by month(o.OrderDate), year(o.OrderDate)
order by order_month, order_year asc;

                      
                                        # Top 5 customers by number of orders
                                        
select c.CompanyName, count(o.OrderID)as total_orders from customers c 
join orders o on c.CustomerID = o.CustomerID
group by c.CompanyName
order by total_orders desc
limit 5;

                                        # Products that never sold
                                        
select p.ProductName from products p 
left join order_details od on p.ProductID = od.ProductID
where od.ProductID is null;

                                        # Rank top 10 products by revenue
                                        
select * from (
    select p.ProductName, round(sum(od.UnitPrice * od.Quantity), 2)as Revenue,
           rank() over(order by round(sum(od.UnitPrice * od.Quantity), 2) desc)as rnk
	from products p 
    join order_details od on p.ProductID = od.ProductID
    group by p.ProductName
)n
where rnk <= 10;

                                       # Top 5 customers in each country by revenue
                                       
select * from (
     select c.CompanyName, c.Country, round(sum(od.UnitPrice * od.Quantity), 2)as revenue,
            dense_rank() over(partition by c.Country order by round(sum(od.UnitPrice * od.Quantity), 2) desc)As den_rnk
	 from customers c
     join orders o on c.CustomerID = o.CustomerID
     join order_details od on o.OrderID = od.OrderID
     group by c.CompanyName, c.Country
)n
where den_rnk <= 5;
