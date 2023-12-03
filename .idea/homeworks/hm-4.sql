-- 1) Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil
SELECT
    COUNT(*) AS Brazil_Count_Orders
FROM Orders
         JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
         JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
        Shippers.ShipperName = 'Speedy Express'
  AND
        Customers.Country = 'Brazil';

-- 2) Вывести среднюю стоимость напитка (Beverages) из Brazil
SELECT
    AVG(Products.Price) AS Average_Price
FROM Products
         JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
         JOIN Categories ON Products.CategoryID = Categories.CategoryID

WHERE
        Categories.CategoryName = 'Beverages'
  AND
        Suppliers.Country = 'Brazil';

-- 3) Расчитать З/П сотрудника с фамилией Davorin (проекция: зп, фамилия сотрудника)
SELECT
    SUM(Products.Price * OrderDetails.Quantity * .02) AS Salary,
    Employees.LastName
FROM Orders
         JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
         JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
         JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE
        Employees.LastName = 'Davolio';

-- ↓ Описание ↓
-- Зарплата сотрудника рассчитывается с учетом его эффективности в продажах.
-- Каждый проданный им продукт приносит дополнительный доход.
-- Сумма его зарплаты зависит от количества и стоимости проданных продуктов.
-- Таким образом, чем больше и дороже товаров он продаст, тем выше будет его зарплата.
