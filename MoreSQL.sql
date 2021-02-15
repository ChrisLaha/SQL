--Christian Lahaine. Do not delete the '--'

/*
	Query 1
	What are the cities, companies, and contacts for Northwind's customers that live in a city starting with an M or an S, sorted by company name?
*/

SELECT CompanyName, ContactName, City 
  FROM Customers
  WHERE City LIKE 'M%'
  OR City LIKE 'S%'
  ORDER BY CompanyName;

/*
	Query 2
	To check for missing data, what are the names of Northwind's employees, sorted by last name, that do not have a region listed in the database?
*/

SELECT LastName, FirstName, Region
  FROM Employees
  WHERE Region IS NULL
  ORDER BY LastName;

/*
	Query 3
	To see what customers are not keeping up with the times, what companies have a fax number listed? Include the contact, city, and country.
*/

SELECT CompanyName, ContactName, City, Country, Fax
  FROM Customers
  WHERE Fax IS NOT NULL;

/*
	Query 4
	Let's start small. Generate the previous query, but limit the results to customers in Germany.
*/

SELECT CompanyName, ContactName, City, Country, Fax
  FROM Customers
  WHERE Country = 'Germany' AND Fax IS NOT NULL;

/*
	Query 5
	What are the products, prices, and number in stock for all products sold by Northwind that have a reorder level less than 15?
*/

SELECT ProductName, UnitPrice, UnitsInStock, ReorderLevel
  FROM Products
  WHERE ReorderLevel < '15';

/*
	Query 6
	What are the names and cities of Northwind's employees that do not live in Seattle?
*/

SELECT LastName, FirstName, City
  FROM Employees
  WHERE NOT City = 'Seattle';

/*
	Query 7
	What orders shipped late? (show all of the fields)
*/

SELECT *
  FROM Orders
  WHERE RequiredDate < ShippedDate;

/*
    Query 8
    What prouducts sold by Northwind have a unit price more than $20 but less than $50?
*/

SELECT ProductName, UnitPrice
  FROM Products
  WHERE UnitPrice BETWEEN 20.01 AND 49.99;

/*
	Query 9
	What are the company names, contacts, city, country, and region of Northwind's customers that live in the Americas (United States, Canada, Mexico, Argentina, Brazil, and Venezuela) but not in the cities of Campinas, Portland, or Vancouver?
*/

SELECT CompanyName, ContactName, City, Country, Region
  FROM Customers
  WHERE Country IN ('USA','Canada','Mexico','Argentina','Brazil','Venezuela')
  AND City NOT IN('Campinas','Portland','Vancouver');



