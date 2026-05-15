Create Database Books_Sales;
Create table books(
	Book_id serial primary key,
    Title varchar(100),
    Author varchar(100),
    Genre varchar(100),
    Published_year int,
    Price numeric(10,2),
    Stock int
);

Create table customer_sales(
	Customer_id serial primary key,
    Name varchar(100),
    Email varchar(100),
    Phone varchar(100),
    City varchar(100),
    Country varchar(100)
);

Create table orders(
	Order_id serial primary key,
    Customer_id int references customer_sales(Customer_id),
    Book_id int references books(Book_id),
    Order_date date,
    Quantity int,
    Total_amount numeric(10,2)
);

select * from books;
select * from customer_sales;
select * from orders;

-- 1) Retrieve all books in the "Fiction" genre:

select * from books
where genre = "Fiction";

-- 2) Find books published after the year 1950:
select * from books
where Published_year >= 1950;

-- 3) List all customers from the Canada:
select * from customer_sales
where Country = "Canada";

-- 4) Show orders placed in November 2023:
select * from orders;
alter table orders
add column Month_Name varchar(10);

Update orders
set Month_Name = monthname(Order_date);

alter table orders
add column Year numeric(4);

update orders
set Year = year(Order_date);

select * from orders
where Month_Name = "November" and Year = 2023;

-- 5) Retrieve the total stock of books available:
select sum(Stock) as Total_Stock
from books;

-- 6) Find the details of the most expensive book:
select * from books
order by Price desc
limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from orders
where Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where Total_amount>20;

 -- 9) List all genres available in the Books table:
select distinct Genre
from books;
 
 -- 10) Find the book with the lowest stock:
select * from books
Order by Stock asc
limit 1;

-- 11) Calculate the total revenue generated from all orders:
select * from orders;
select sum(Total_amount) as Total_revenue
from orders;

 -- Advance SQL
 -- 1) Retrieve the total number of books sold for each genre:
select * from orders;
select * from books;
 
SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
select * from books;

select avg(Price) as Avg_price
from books
where Genre = "Fantasy";

-- 3) List customers who have placed at least 2 orders
SELECT c.Customer_id, c.Name, count(o.Quantity) as Count_Orders
FROM Orders o
JOIN customer_sales c on c.Customer_id = o.Customer_id
GROUP BY o.Customer_id, c.Name
HAVING count(o.Quantity) = 2;

-- 4) Find the most frequently ordered book:
SELECT o.Book_id, b.Title, count(o.Quantity) as Freq_Ordered
FROM Orders o
JOIN books b on o.Book_id = b.Book_id
GROUP BY o.Book_id, b.Title
ORDER BY count(o.Quantity) desc
LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from books
where Genre = "Fantasy"
Order by Price desc
Limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT b.Author, sum(o.Quantity) as Total_book_sold_by_auth
FROM Orders o
JOIN books b on b.Book_id = o.Book_id
GROUP BY b.Author;

-- 7) List the cities where customers who spent over $30 are located:
SELECT distinct c.City, total_amount
FROM orders o
JOIN customer_sales c on c.Customer_id = o.Customer_id
where total_amount > 30;

-- 8) Find the customer who spent the most on orders:

SELECT c.Customer_id, c.Name, sum(o.Total_amount) as Most_Ordered_cust
FROM Orders o
JOIN customer_sales c on c.Customer_id = o.Customer_id
GROUP BY c.Customer_id, c.Name
ORDER BY Most_Ordered_cust desc 
LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;











