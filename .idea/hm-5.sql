-- 1) Вывести мин/стоимость товаров для каждой категории (проекция: названиекатегории, минстоимость_товара)
SELECT
    Categories.CategoryName,
    MIN(Products.Price) AS min_cost_product
FROM OrderDetails
         JOIN Products ON OrderDetails.ProductID = Products.ProductID
         JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryID
ORDER BY min_cost_product


-- 2) Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
    Customers.Country,
    Count(Customers.Country) AS delivered_orders
FROM OrderDetails
         JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
         JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country
ORDER BY delivered_orders DESC
LIMIT 3


-- 3) Вывести ко-во заказов у каждого менеджера (фамилияменеджера, ко-возаказов)
SELECT
    Employees.LastName,
    COUNT(Orders.OrderID) AS quantity_orders
FROM OrderDetails
         JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
         JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY quantity_orders DESC