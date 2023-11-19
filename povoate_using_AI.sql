-- Enable foreign key constraints
PRAGMA foreign_keys = ON;

-- Insert data into Persons table
INSERT INTO Persons (PersonID, NIF, Name, Address) VALUES
    (1, 123456789, 'John Doe', '123 Main St'),
    (2, 987654321, 'Jane Smith', '456 Oak St');
-- Add more data as needed for other tables

-- Insert data into Clients table
INSERT INTO Clients (ClientID, Phone, Email, PersonID) VALUES
    (1, '555-1234', 'john@example.com', 1),
    (2, '555-5678', 'jane@example.com', 2);
-- Add more data as needed for other tables

-- Insert data into CustomerServices table
INSERT INTO CustomerServices (CustomerServiceID, ID, Urgency, Description) VALUES
    (1, 101, 'High', 'Product support'),
    (2, 102, 'Medium', 'Billing inquiry');
-- Add more data as needed for other tables

-- Insert data into Sells table
INSERT INTO Sells (SellID, ID, Price, Date, PaymentFormat, ClientID) VALUES
    (1, 201, 100.00, '2023-01-01', 'Credit Card', 1),
    (2, 202, 150.00, '2023-02-01', 'Cash', 2);
-- Add more data as needed for other tables

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, Shift, PersonID) VALUES
    (1, 'Morning', 1),
    (2, 'Evening', 2);
-- Add more data as needed for other tables

-- Insert data into Products table
INSERT INTO Products (ProductID, ID, Price, Stock, Material, Name) VALUES
    (1, 301, 29.99, 100, 'Metal', 'Widget A'),
    (2, 302, 49.99, 50, 'Plastic', 'Gadget B');
-- Add more data as needed for other tables

-- Insert data into Providers table
INSERT INTO Providers (ProviderID, ID, Address, Phone, Email, Name) VALUES
    (1, 401, '789 Oak St', '555-4321', 'provider1@example.com', 'Provider X'),
    (2, 402, '456 Pine St', '555-8765', 'provider2@example.com', 'Provider Y');
-- Add more data as needed for other tables

-- Insert data into Avaliations table
INSERT INTO Avaliations (AvaliationID, ID, Stars, Description, Date, ClientID) VALUES
    (1, 501, 4, 'Great service!', '2023-03-01', 1),
    (2, 502, 5, 'Excellent product!', '2023-04-01', 2);
-- Add more data as needed for other tables

-- Insert data into Departments table
INSERT INTO Departments (DepartmentID, ID, Name) VALUES
    (1, 601, 'Sales'),
    (2, 602, 'Customer Support');
-- Add more data as needed for other tables

-- Insert data into Exchanges table
INSERT INTO Exchanges (ExchangeID, ID, Discount, Channel, ClientID) VALUES
    (1, 701, 10.00, 'Online', 1),
    (2, 702, 5.00, 'In-Store', 2);
-- Add more data as needed for other tables

-- Insert data into MarketCampaigns table
INSERT INTO MarketCampaigns (MarketCampaignID, ID, Discount, Channel) VALUES
    (1, 801, 15.00, 'Email'),
    (2, 802, 20.00, 'Social Media');
-- Add more data as needed for other tables
