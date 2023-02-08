/* joins: select all the computers from the products table:
using the products table and the categories table, 
return the product name and the category name */
SELECT categories.Name AS 'Category', products.Name AS 'Products'  
FROM categories
INNER JOIN products 
ON categories.CategoryID = products.CategoryID
WHERE categories.Name = '%Computers%'
; 


/* joins: find all product names, product prices, and products ratings 
that have a rating of 5 */
SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews 
ON reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold. 
use the sum() function and group by */
SELECT sales.EmployeeID, SUM(sales.Quantity) as TotalSales, employees.FirstName, employees.LastName
FROM sales
INNER JOIN employees
ON employees.EmployeeID = sales.EmployeeID
GROUP BY sales.EmployeeID 
ORDER BY TotalSales DESC;

-- SELECT employees.FirstName, employees.LastName, sales.Quantity, sales.EmployeeID, SUM(sales.Quantity)
-- FROM sales
-- GROUP BY sales.EmployeeID
-- LEFT JOIN employees ON sales.EmployeeID = employees.EmployeeID;



/* joins: find the name of the department,
 and the name of the category for Appliances and Games */
 SELECT departments.Name AS departName, categories.Name AS catName
 FROM departments
 INNER JOIN categories
 ON departments.DepartmentID = categories.DepartmentID
 WHERE categories.Name = "Appliances" OR categories.Name = "Games";
 

/* joins: find the product name,
 total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT products.Name AS "item", SUM(sales.PricePerUnit *sales.Quantity) AS "Total Sold"
 FROM products
 INNER JOIN sales
 ON products.ProductID = sales.ProductID
 GROUP BY sales.ProductID 
 HAVING products.Name LIKE '%Hotel%California%';

/* joins: find Product name, reviewer name, rating, and comment 
on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM reviews
INNER JOIN products
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%visio%tv%"
ORDER BY reviews.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT employees.EmployeeID, 
CONCAT (employees.FirstName, " ",  employees.LastName), 
sales.Quantity,
products.Name, 
sales.Quantity * sales.PricePerUnit AS "Total Sold"
FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products
ON products.ProductID = sales.ProductID
ORDER BY employees.EmployeeID;