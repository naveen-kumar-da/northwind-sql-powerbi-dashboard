# Northwind Sales Analysis Dashboard (SQL + Power BI)

A sales analysis of the classic Northwind dataset, using SQL for data querying and Power BI for building an interactive dashboard.

## Tools Used
- MySQL (querying, joins, window functions)
- Power BI (interactive dashboard)

## Dataset
Northwind database tables: `customers`, `orders`, `order_details`, `products`, `categories`

## What's Inside
- `Northwind_Analysis_Dashboard.pbix` — the Power BI dashboard file
- `Project_PowerBI.sql` — SQL queries used to prepare and analyze the data

## SQL Analysis Covers
- Total customers, orders, products, and categories
- Total revenue and average order value
- Top 10 customers by total purchase amount
- Top 10 best-selling products by quantity
- Revenue by category (including top 5 categories)
- Monthly sales trend
- Top 5 customers by number of orders
- Products that have never sold
- Top 10 products ranked by revenue (using `RANK()`)
- Top 5 customers per country by revenue (using `DENSE_RANK()`)

## How to View
Open `Northwind_Analysis_Dashboard.pbix` in Power BI Desktop to explore the interactive dashboard, or run `Project_PowerBI.sql` against a MySQL instance to see the underlying queries.
