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
CREATE TABLE Customers (
CustomerID VARCHAR(100) PRIMARY KEY,
CompanyName VARCHAR(100),
Address VARCHAR(100),
City VARCHAR(100),
Country VARCHAR(100));
INSERT INTO Customers VALUES
("ALFKI", "Alfreds Futterkiste", "Obere Str.57", "Berlin", "Germany"),
("ANATR", "Ana Trujillo Emparedados y helados",	"Avda.de la Constitución 2222", "México D.F.", "Mexico"),
("ANTON", "Antonio Moreno Taquería", "Mataderos 2312",	"México D.F.", "Mexico"),
("AROUT", "Around the Horn", "120 Hanover Sq.",	"London", "UK"),
("BERGS", "Berglunds snabbköp",	"Berguvsvägen 8", "Luleå", "Sweden"),
("BLAUS", "Blauer See Delikatessen", "Forsterstr.57", "MannheimCity", "Germany"),
("BLONP", "Blondesddsl père et fils", "24,place Kléber", "StrasbourgCity", "France"),
("BOLID", "Bólido Comidas preparadas", "C/ Araquil,67", "MadridCity", "Spain");
/*1. Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997 */
SELECT Customers.CompanyName
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE OrderDate NOT IN (
SELECT OrderDate  
FROM Orders
WHERE STR_TO_DATE(OrderDate, '%d.%m.%Y') BETWEEN 
STR_TO_DATE('15.11.1996', '%d.%m.%Y') AND STR_TO_DATE('18.02.1997', '%d.%m.%Y'));
/*2. Вывести названия компаний поставщиков, которые находятся в México D.F*/
SELECT CompanyName FROM customers
WHERE City = "México D.F.";
/* 3. Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997*/
SELECT OrderID FROM Orders
WHERE STR_TO_DATE(OrderDate, '%d.%m.%Y') BETWEEN 
STR_TO_DATE('12.12.1996', '%d.%m.%Y') AND STR_TO_DATE('18.02.1997', '%d.%m.%Y');
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
/* 4. Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;*/
SELECT CompanyName FROM Customers
WHERE CompanyName
LIKE "%An_%";
/* 5.Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000. Использовать соединение таблиц.*/
SELECT Customers.CompanyName, Orders.OrderID
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE OrderSum > 17000;
/*6.Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания*/
SELECT Customers.CompanyName, Orders.OrderSum
FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
ORDER BY OrderSum DESC;
/*7.Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов*/
SELECT Customers.CompanyName, Orders.OrderDate
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
