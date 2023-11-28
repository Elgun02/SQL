-- 1) Вывести название и стоимость в 'USD' одного самого дорогого проданного товара
SELECT
    Products.ProductName,
    Products.Price * 1.1 AS Price_USD
FROM OrderDetails
         JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Products.Price DESC, OrderDetails.Quantity DESC
LIMIT 1;


-- 2) Вывести два самых дорогих товара из категории 'Beverages' из 'USA'
SELECT
    Products.ProductID,
    Products.ProductName,
    Products.Unit,
    Products.Price,
    Categories.CategoryName,
    Suppliers.Country
FROM Products
         JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
         JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE
        Suppliers.Country = 'USA'
  AND
        Categories.CategoryName = 'Beverages'
ORDER BY Products.Price DESC
LIMIT 2;

-- 3) Удалить товары с ценой менее 50 EUR
DELETE FROM Products
WHERE Price < 50;


-- 4) Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
    Suppliers.Country
FROM Products
         JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
         JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE
        Categories.CategoryName = 'Seafood';


-- 5) Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName = ''
WHERE Country != 'China';