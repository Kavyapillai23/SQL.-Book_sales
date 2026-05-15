# Books Sales Analysis (SQL)

## Project Overview
This project demonstrates a comprehensive SQL workflow for a bookstore management system. It covers database creation, table schema design, data manipulation, and advanced business intelligence queries.

## Database Schema
The database `Books_Sales` consists of three primary tables:
* **Books**: Stores book details (ID, Title, Author, Genre, Price, Stock).
* **Customer_Sales**: Stores customers details (ID, Name,Email, Phone, City, Country)
* **Orders**: Tracks sales transactions, linking customers to specific books.

## Key Insights & Queries
The analysis includes:
* **Inventory Management**: Calculating remaining stock after sales and identifying low-stock items.
* **Sales Trends**: Tracking revenue by genre, author, and time period (specifically November 2023).
* **Customer Analytics**: Identifying high-value customers and frequent buyers.
* **Advanced Joins**: Using `JOIN`, `GROUP BY`, and `COALESCE` for complex data retrieval.

## How to Run
Import the `Books.sql` file into your preferred SQL environment (PostgreSQL/MySQL) to recreate the database and run the analysis.
