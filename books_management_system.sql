CREATE TABLE Books (
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Auhor VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10, 2),
	Stock INT
);

CREATE TABLE Customer (
	Customer_id SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(50),
	City VARCHAR(50),
	Country VARCHAR(150)
	
);

CREATE TABLE Orders (
	Order_id SERIAl PRIMARY KEY,
	Customer_id INT REFERENCES Customer(Customer_id),
	Book_id INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM Orders;

-- 1. Retrive all books in the "Fiction" genre:

SELECT * FROM Books
Where genre = 'Fiction';

-- 2. Find Books published after the year 1956:
SELECT * FROM Books
WHERE  published_year > 1950;

-- 3. List all Customers From canada:
SELECT * FROM Customer
WHERE country = 'Canada';

-- 4. Show orders placed in November 2023:
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5. Retrive the total stock of books available
SELECT SUM(stock) AS Total_stocks FROM Books;

--6.Find the details of the most expensive book:
SELECT * FROM Books ORDER BY Price DESC LIMIT 1;

--7. Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE quantity > 1;

--8. Retrive all orders where the total amount exceed $20:
SELECT * FROM Orders
WHERE total_amount > 20;

--9. List all genres available in the books table:
SELECT DISTINCT genre FROM Books;

-- 10. Find the book with lowest stock:
SELECT * FROM Books ORDER BY stock LIMIT 1;

-- 11. Calculate the total Revenue generated from all orders:
SELECT SUM(total_amount) AS total_Revenue FROM Orders;

-- Advanced Questions :

-- 1. Retrieve the total number of books sold for each  genre:
SELECT b.genre, SUM(o.quantity) AS total_sold 
FROM Orders o JOIN Books b ON o.book_id = b.book_id
GROUP BY b.genre;

-- 2. Find the average price of books in the Fantasy genre:
SELECT AVG(price) AS Average_price FROM Books
WHERE genre = 'Fantasy';

-- 3. list customers who have placed at least 2 orders:
SELECT o.customer_id, c.Name, COUNT(o.order_id) AS Order_count
FROM Orders o 
JOIN Customer c ON o.Customer_id = c.Customer_id
GROUP BY o.Customer_id, c.name
HAVING COUNT(order_id) >= 2;

-- 4. Find the most Frequently ordered book:
SELECT o.Book_id, b.Title, COUNT(o.order_id) AS Order_count
FROM orders o
JOIN Books b ON b.book_id = o.book_id
GROUP BY o.Book_id, b.Title
ORDER BY Order_count DESC LIMIT 1;

-- 5. Show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;

-- 6. Retrieve the total quantity of books sold by each author:
SELECT b.auhor, SUM(o.quantity) AS TotalBook_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.auhor;

-- 7. List the cities where customer who spent over $30 are located:
SELECT DISTINCT c.City, total_amount 
FROM orders o 
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.total_amount > 30;

-- 8. Find the customer who spend the most on orders:
SELECT c.Customer_id, c.Name, SUM(o.total_amount) AS total_spend
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spend DESC;

--  9. Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity), 0) AS order_quantity, b.stock - COALESCE(SUM(o.quantity), 0) AS Remaining_quantity   
FROM Books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id;








