CREATE TABLE Orders (
OrderID INT PRIMARY KEY, 
CustomerID VARCHAR(30),
OrderDate DATE,
OrderSum INT);
INSERT INTO Orders VALUES
(10355, "AROUT", "15.11.1996", 10000),
(10365, "ANTON", "27.11.1996", 15000),
(10381, "LILAS", "12.12.1996", 20000),
(10436,	"BLONP", "05.02.1997", 17500),
(10442,	"ERNSH", "11.02.1997", 20000),
(10449,	"BLONP", "18.02.1997", 10000),
(10453,	"AROUT", "21.02.1997", 15000);
DROP TABLE Customers;
CREATE TABLE Customers (
CustomerID VARCHAR(100) PRIMARY KEY,
CompanyName VARCHAR(100),
Address VARCHAR(100),
City VARCHAR(100),
Country VARCHAR(100));
DESC Customers;
INSERT INTO Customers VALUES
("ALFKI", "Alfreds Futterkiste", "Obere Str.57", "Berlin", "Germany"),
("ANATR", "Ana Trujillo Emparedados y helados",	"Avda.de la Constitución 2222", "México D.F.", "Mexico"),
("ANTON", "Antonio Moreno Taquería", "Mataderos 2312",	"México D.F.", "Mexico"),
("AROUT", "Around the Horn", "120 Hanover Sq.",	"London", "UK"),
("BERGS", "Berglunds snabbköp",	"Berguvsvägen 8", "Luleå", "Sweden"),
("BLAUS", "Blauer See Delikatessen", "Forsterstr.57", "MannheimCity", "Germany"),
("BLONP", "Blondesddsl père et fils", "24,place Kléber", "StrasbourgCity", "France"),
("BOLID", "Bólido Comidas preparadas", "C/ Araquil,67", "MadridCity", "Spain");
/*1 запрос*/
SELECT Customers.CompanyName
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE OrderDate NOT IN (
SELECT OrderDate  
FROM Orders
WHERE STR_TO_DATE(OrderDate, '%d.%m.%Y') BETWEEN 
STR_TO_DATE('15.11.1996', '%d.%m.%Y') AND STR_TO_DATE('18.02.1997', '%d.%m.%Y'));



/*2 запрос*/
SELECT CompanyName FROM customers
WHERE City = "México D.F.";
/* 3 запрос */
SELECT OrderID FROM Orders
WHERE STR_TO_DATE(OrderDate, '%d.%m.%Y') BETWEEN 
STR_TO_DATE('12.12.1996', '%d.%m.%Y') AND STR_TO_DATE('18.02.1997', '%d.%m.%Y');
/* 4 request*/
DROP TABLE Clients;
CREATE TABLE Clients (
ClientID INT PRIMARY KEY, 
ClientType VARCHAR(30),
ClientName VARCHAR(50));
INSERT INTO Clients VALUES
(155, "PRIV", "Иванов Иван Иваныч"),
(225, "PRIV", "Иванов Петр Сидорович"),
(226, "ORG", 'ООО \"Иванов\"'),
(358, "PRIV", "Петров Иван Иваныч"),
(598, "ORG", "ИП Сидоров И.П."),
(973, "PRIV", "Сидоров Иван Петрович");
select * from clients;
SELECT CompanyName FROM Customers
WHERE CompanyName
LIKE "%An_%";
/* 5 request*/
SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderSum
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE OrderSum in (
SELECT OrderSum FROM Orders
WHERE OrderSum > 17000
);
/*6 request*/
SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderSum
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE CompanyName IN (
SELECT CompanyName  
FROM Customers)
ORDER BY CompanyName DESC;
/*7 request*/
SELECT Customers.CompanyName, Orders.OrderDate
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
/* задание 5 */
DROP TABLE Deposits;
CREATE TABLE Deposits (
id INT,
ClientID INT, 
AccountID bigint,
Currency VARCHAR(10),
Saldo DEC(10,2),
StatusID INT);
INSERT INTO Deposits VALUES
(1, 65743, 1354686498, "RUB", 0, 11255),
(2, 63522, 7319797999, "EUR", 14.5, 11255),
(3, 43532, 165489952, "USD", 2164.89, 11255),
(4,	65674, 4687954697, "USD", 114.0, 11258),
(5, 63522, 1133547879, "RUB", 0, 11255),
(6,	56889, 265985499, "EUR", 447.54, 11255),
(7,	65674, 3565659988, "RUB", 0, 32565),
(8,	65743, 7489415891, "USD", 57.4,	11255),
(9,	43532, 1564898811, "RUB", 25574.84, 11255),
(10, 63522,	2645988554,	"USD", 0, 32565),
(11, 43532, 2123659887,	"RUB", 125484.89, 11255),
(12, 43532,	3125477787,	"EUR", 66.95, 11255);

CREATE TABLE Deposits (
id INT,
ClientID INT, 
AccountID bigint,
Currency VARCHAR(10),
Saldo DEC(10,2),
StatusID INT);
INSERT INTO Deposits VALUES
(1, 65743, 1354686498, "RUB", 0, 11255),
(2, 63522, 7319797999, "EUR", 14.5, 11255),
(3, 43532, 165489952, "USD", 2164.89, 11255),
(4,	65674, 4687954697, "USD", 114.0, 11258),
(5, 63522, 1133547879, "RUB", 0, 11255),
(6,	56889, 265985499, "EUR", 447.54, 11255),
(7,	65674, 3565659988, "RUB", 0, 32565),
(8,	65743, 7489415891, "USD", 57.4,	11255),
(9,	43532, 1564898811, "RUB", 25574.84, 11255),
(10, 63522,	2645988554,	"USD", 0, 32565),
(11, 43532, 2123659887,	"RUB", 125484.89, 11255),
(12, 43532,	3125477787,	"EUR", 66.95, 11255);

SELECT * FROM Deposits;
CREATE TEMPORARY TABLE tmp_table (
ФИО_клиента varchar(100) NOT NULL primary key,
Рубли INT NOT NULL,
Доллары INT NOT NULL,
Евро INT NOT NULL);
DESC tmp_table;

SELECT Deposits.ClientID, Deposits.Currency, Deposits.Saldo,  Deposits.StatusID, Clients.ClientName
FROM Deposits JOIN Clients
ON Deposits.ClientID = Clients.ClientID
WHERE StatusID IN (
SELECT StatusID
FROM Deposits
WHERE StatusID = 11255);

Select Customers.CompanyName 
from Customers 
join Orders 
on Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate<to_date('15.11.1996','dd.mm.yyyy') and
Orders.OrderDate>to_date('18.02.1997','dd.mm.yyyy');

SELECT OrderID from orders WHERE OrderDate BETWEEN '12.12.1996' and '18.02.1997'; 
SELECT CompanyName FROM Customers
WHERE CompanyName
LIKE "%An_%";

SELECT customers.CompanyName, orders.OrderID FROM customers  
  JOIN orders on customers.CustomerID = orders.CustomerID 
    WHERE OrderSum < 17000;    


Select Customers.CompanyName from Customers 
join Orders on Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate<to_date('15.11.1996','dd.mm.yyyy') and
Orders.OrderDate>to_date('18.02.1997','dd.mm.yyyy');


SELECT OrderID from orders WHERE OrderDate BETWEEN '12.12.1996' and '18.02.1997'; 
  
 SELECT CompanyName from customers WHERE CompanyName like 'An%';



SELECT customers.CompanyName, orders.OrderSum FROM customers  
  JOIN orders on customers.CustomerID = orders.CustomerID 
    ORDER BY OrderSum DESC;