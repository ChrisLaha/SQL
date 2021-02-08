--Christian Lahaine. Do not delete the '--'

/*
	Query 1
	From the SQL Setup HW
*/
SELECT *
	FROM Customers;

/*
	Query 2
	In what countries does Northwind have customers?
*/

SELECT Country
  FROM Customers;

/*
    Query 3
    What are the unique job titles that Northwind's supplier contacts have?
*/

SELECT ContactTitle
  FROM Suppliers;

/*
	Query 4
	What are the names, titles, and phone numbers of Northwind's customers?
*/

SELECT ContactName, ContactTitle, Phone
  FROM Customers;

/*
    Query 5
    In order from largest shipping fee to smallest shipping fee, what are the id, the date the order was placed, the date the order was shipped, the id of the customer who placed the order, and the shipping fee charged for all orders in the Northwind database?
*/

SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
  FROM Orders
  ORDER BY Freight DESC;

/*
	Query 6
	What are the company names, customer names of all of Northwind's customers in London (go ahead and list cities as a check)?
*/

SELECT CompanyName, ContactName
  FROM Customers
  WHERE City='London';