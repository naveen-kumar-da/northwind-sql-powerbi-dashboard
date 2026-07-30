# Northwind Sales & Product Analytics Dashboard (SQL + Power BI)

A multi-page sales and product performance dashboard built on the classic Northwind dataset, using MySQL for data querying and Power BI for interactive visualization.

## Tools Used
- MySQL (querying, joins, window functions)
- Power BI (Power Query, DAX, interactive dashboard design)

## Dataset
Northwind database tables: `customers`, `orders`, `order_details`, `products`, `categories`

## What's Inside
- `Northwind_Analysis_Dashboard.pbix` — the Power BI dashboard file (2 pages: Executive Dashboard, Product Analysis)
- `Project_PowerBI.sql` — SQL queries used to prepare and analyze the data

## Dashboard Pages

**Executive Dashboard** — high-level KPIs (total revenue, orders, customers, products), revenue by category, top customers by revenue, monthly sales trend, and revenue by country.

**Product Analysis** — top products by revenue and quantity, category-wise quantity breakdown, and a detailed customer revenue table, filterable by Year, Category, and Country.

## Key Features
- Multi-page interactive dashboard with custom navigation buttons between pages
- Resolved character encoding inconsistencies (mojibake) in MySQL source data using a Power Query transformation, so accented product and customer names display correctly
- Unified navy-blue theme applied consistently across all report pages
- Dynamic slicers (Year, Category, Country) for on-the-fly filtering
- Uniform sizing and alignment across all visuals for a clean, professional layout

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
