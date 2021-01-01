-- NO 1.1
SELECT * FROM customers;
SELECT COUNT(distinct customerNumber) AS Customers,
COUNT(distinct city) AS Cities,
COUNT(distinct country) AS Countries
FROM customers;
DESC customers;

-- NO 1.2
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM products;
DESC products;
SELECT COUNT(productCode) FROM products;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM productlines;
SELECT * FROM customers;

SELECT count(distinct employeeNumber) AS Employees,
count(distinct o.officeCode) AS Offices,
count(distinct o.country) AS Country,
count(distinct pro.productCode) AS Products,
sum(distinct pro.quantityInStock) AS StockProducts,
count(distinct pro.productVendor) AS Vendors
FROM employees e
JOIN offices o 
JOIN products pro;

-- NO 1.3
SELECT distinct pro.productLine AS ProductLine,
min(buyPrice) AS minPrice,
max(buyPrice) AS maxPrice
FROM products pro
GROUP BY pro.productLine;

-- No 1.4
SELECT c.customerName, c.city, c.country, SUM(p.amount) 
FROM customers c
JOIN payments p
USING (customerNumber)
GROUP BY c.customerName
ORDER BY SUM(p.amount) DESC 
limit 10;

-- NO 1.5
SELECT * FROM payments;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orderdetails;
SELECT * FROM orders;

SELECT c.customerName, pr.productName, od.priceEach, od.quantityOrdered
from payments p
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products pr
USING (productCode)
WHERE p.paymentDate = '2003-06-05' ;

SELECT * FROM payments WHERE paymentDate='2003-06-05'
