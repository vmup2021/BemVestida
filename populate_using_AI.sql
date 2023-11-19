PRAGMA foreign_keys = ON;

-- Insert data into Employees Table (R1)
INSERT INTO Employees (NIF, Name, Address, WorkShift, EmployeeType, DepartmentID)
VALUES
    (111, 'John Doe', '123 Main St', 'Day', 'Manager', 1),
    (222, 'Jane Smith', '456 Oak St', 'Night', 'Employee', 1),
    (333, 'Bob Johnson', '789 Pine St', 'Day', 'Employee', 2);

-- Insert data into Managers Table (R2)
INSERT INTO Managers (ManagerID, DepartmentManaged)
VALUES
    (111, 'Clothing Department'),
    (444, 'Shoe Department');

-- Insert data into Customers Table (R3)
INSERT INTO Customers (NIF, Name, ContactDetails)
VALUES
    (1111, 'Alice Brown', 'email@example.com'),
    (2222, 'Charlie Green', 'phone_number');

-- Insert data into Products Table (R4)
INSERT INTO Products (ProductID, Price, ProductName, QuantityInStock)
VALUES
    (1, 50.0, 'T-Shirt', 100),
    (2, 80.0, 'Jeans', 50),
    (3, 30.0, 'Sneakers', 75);

-- Insert data into Sales Table (R5)
INSERT INTO Sales (SaleID, NIF, EmployeeNIF, Price, PaymentMethod, Date)
VALUES
    (101, 1111, 222, 50.0, 'Credit Card', '2023-11-19'),
    (102, 2222, 333, 80.0, 'Cash', '2023-11-20');

-- Insert data into Suppliers Table (R6)
INSERT INTO Suppliers (SupplierID, Name, Address, Number, ContactDetails)
VALUES
    (1, 'Fashion Supplier', '789 Supplier St', '123456789', 'supplier@example.com');

-- Insert data into Affiliations Table (R7)
INSERT INTO Affiliations (AffiliationID, SaleID)
VALUES
    (201, 101),
    (202, 102);

-- Insert data into MarketingCampaigns Table (R8)
INSERT INTO MarketingCampaigns (CampaignID, DiscountPercentage, Channel)
VALUES
    (301, 10.0, 'Instagram'),
    (302, 15.0, 'YouTube');

-- Insert data into ProductInCampaigns Table (R9)
INSERT INTO ProductInCampaigns (CampaignID, ProductID)
VALUES
    (301, 1),
    (302, 2);

-- Insert data into SACCalls Table (R10)
INSERT INTO SACCalls (CallID, Protocol, DegreeOfUrgency, ShortDescription, CustomerNIF)
VALUES
    (501, 'ABC123', 'High', 'Product Complaint', 1111),
    (502, 'XYZ456', 'Low', 'Inquiry', 2222);

-- Insert data into Ratings Table (R11)
INSERT INTO Ratings (RatingID, ProductID, Stars, Comments)
VALUES
    (601, 1, 4, 'Great product!'),
    (602, 2, 5, 'Perfect fit!');

-- Insert data into Exchanges Table (R12)
INSERT INTO Exchanges (ExchangeID, OriginalProductID, NewProductID)
VALUES
    (701, 1, 3),
    (702, 2, 1);

