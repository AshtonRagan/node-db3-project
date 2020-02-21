-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName
FROM Product
    INNER JOIN Category on  Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT id as OrderID , Shipper.CompanyName
FROM [Order]
    JOIN Shipper ON [Order].ShipVia = Shipper.Id
WHERE [Order].OrderDate < `2012-9-8
`;


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName , OrderDetail.Quantity
FROM OrderDetail
    INNER JOIN Product ON OrderDetail.ProductId = Product.Id
WHERE Orderid = 10251


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id as orderId, Customer.CompanyName, Employee.LastName
FROM [Order]
    INNER JOIN Customer ON Customer.Id = [Order].CustomerId
    INNER JOIN Employee ON Employee.Id = [Order].EmployeeId


