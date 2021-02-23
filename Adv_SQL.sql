--Christian Lahaine. Do not delete the '--'

/*
	Query 1
	What are the employees responsible for a sale (last name only), the ID of the order, the shipping name, shipping country, and shipping fee for orders placed to ship to customers in the UK and Ireland?
*/

SELECT Employees.LastName, Orders.OrderID, Orders.ShipName, Orders.ShipCountry, Orders.Freight
  FROM Employees JOIN Orders
  ON Orders.EmployeeID = Employees.EmployeeID
  WHERE ShipCountry IN ('UK', 'Ireland');

/*
	Query 2
	How many customers does Northwind have in each country in which they do business?
*/

SELECT Country, COUNT(*) AS Number
  FROM Customers
  GROUP BY Country
  ORDER BY Country;

/*
    Query 3
    What prouducts sold by Northwind have a unit price more than $20 but less than $50 and are currently in stock?
*/

SELECT ProductName, UnitPrice, UnitsInStock
  From Products
  WHERE UnitsInStock >= 1
  AND UnitPrice BETWEEN 20.01 AND 49.99; 

/*
	Query 4
	How many of Northwind's customers are explicitly identified as "Manager" in their job title? Show the individual count for all of the various "Manager" titles.
*/

SELECT ContactTitle, COUNT(*) AS Number
 FROM Customers
 WHERE ContactTitle REGEXP '[[:<:]]Manager[[:>:]]'
 GROUP BY ContactTitle;

/*
	Query 5
	How many of Northwind's customers, that don't work in sales, are explicitly identified as "Manager" in their job title? Show the individual count for all of the various "Manager" titles. Please use a subquery.
*/

SELECT ContactTitle, COUNT(*) AS Number
 FROM Customers
 WHERE ContactTitle REGEXP '[[:<:]]Manager[[:>:]]'
 AND ContactTitle NOT LIKE 'Sales%'
 GROUP BY ContactTitle;


/*
    Query 6
    What is the total order price for each order listed in Northwind's database?
*/

SELECT DISTINCT OrderID, UnitPrice * Quantity - (Discount * UnitPrice * Quantity) 
  FROM OrderDetails;

/*
    Query 7
    Add to the previous query. Include the Customer ID and Shipping Name for each order that is totaled in the previous query. Sort the output by Customer ID.
*/

SELECT Orders.CustomerID, Orders.ShipName, OrderDetails.OrderID,
  OrderDetails.UnitPrice * OrderDetails.Quantity - (OrderDetails.Discount * OrderDetails.UnitPrice * OrderDetails.Quantity) 
  FROM Orders JOIN OrderDetails
  ON Orders.OrderID = OrderDetails.OrderID;
  

/*
    Query 8
    Add to the previous query. Include the Title of Courtesy, First Name, and Last Name of the Northwind employee responsible for each sale. Sort the output by the responsible employee's last name.

    EXTRA CREDIT: Edit the query so the responsible employee's information appears in one single column in the output. Results must still be sorted by the employee's last name.
*/

SELECT DISTINCT Employees.TitleOfCourtesy, Employees.FirstName, Employees.LastName,
  Orders.CustomerID, Orders.ShipName, OrderDetails.OrderID,
  OrderDetails.UnitPrice * OrderDetails.Quantity - (OrderDetails.Discount * OrderDetails.UnitPrice * OrderDetails.Quantity)
  FROM Employees JOIN Orders
  ON Employees.EmployeeID = Orders.EmployeeID
  JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  ORDER BY Employees.LastName;




