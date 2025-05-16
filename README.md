# SQL_Project_01
# 📚 Books Management System - SQL Project

This is a Data Analytics project built using **PostgreSQL**, designed to simulate and analyze a bookstore's database. The project focuses on building relational tables and performing analytical queries to generate insights about books, customers, and orders.

## 👨‍🏫 Guided By
**Satish Dawale Sir**

## 🧠 Skills Demonstrated
- SQL (PostgreSQL)
- Data modeling
- Analytical querying
- Joins, aggregation, subqueries
- Business insight generation

---

## 🏗️ Project Structure

- **Tables Created:**
  - `Books` – stores book metadata
  - `Customer` – stores customer information
  - `Orders` – tracks orders placed, including quantities and total amounts

- **Sample Queries:**
  - Retrieve best-selling genres
  - Identify most valuable customers
  - Analyze revenue trends
  - Track book inventory and sales
  - Calculate total revenue and average prices
  - Advanced insights using GROUP BY, JOINs, HAVING clauses

---

## 🧾 Example Insights

- Most frequently ordered book and its count  
- Total revenue from all orders  
- Customers who placed 2+ orders  
- Remaining stock after fulfilling orders  
- Cities with high-value customers  

---

## 📂 Files Included

- `books_management_system.sql`:  
  Contains all SQL commands – table creation, inserts (if any), and 30+ queries ranging from basic SELECT to advanced analytics

---

## 📈 Sample Query

```sql
-- Find the most frequently ordered book
SELECT o.Book_id, b.Title, COUNT(o.order_id) AS Order_count
FROM Orders o
JOIN Books b ON b.book_id = o.book_id
GROUP BY o.Book_id, b.Title
ORDER BY Order_count DESC
LIMIT 1;
