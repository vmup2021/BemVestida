-- Drop existing relations if they exist
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Managers;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Affiliations;
DROP TABLE IF EXISTS MarketingCampaigns;
DROP TABLE IF EXISTS ProductInCampaigns;
DROP TABLE IF EXISTS SACCalls;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Exchanges;

-- Create Employees Table (R1)
CREATE TABLE Employees (
    NIF INTEGER PRIMARY KEY,
    Name TEXT,
    Address TEXT,
    WorkShift TEXT,
    EmployeeType TEXT,
    DepartmentID INTEGER,
    UNIQUE (NIF),
    FOREIGN KEY (DepartmentID) REFERENCES Managers(ManagerID)
);

-- Create Managers Table (R2)
CREATE TABLE Managers (
    ManagerID INTEGER PRIMARY KEY,
    DepartmentManaged TEXT,
    UNIQUE (ManagerID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(NIF)
);

-- Create Customers Table (R3)
CREATE TABLE Customers (
    NIF INTEGER PRIMARY KEY,
    Name TEXT,
    ContactDetails TEXT,
    UNIQUE (NIF)
);

-- Create Products Table (R4)
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    Price REAL,
    ProductName TEXT,
    QuantityInStock INTEGER,
    UNIQUE (ProductID)
);

-- Create Sales Table (R5)
CREATE TABLE Sales (
    SaleID INTEGER PRIMARY KEY,
    NIF INTEGER,
    EmployeeNIF INTEGER,
    Price REAL,
    PaymentMethod TEXT,
    Date DATE,
    UNIQUE (SaleID),
    FOREIGN KEY (NIF) REFERENCES Customers(NIF),
    FOREIGN KEY (EmployeeNIF) REFERENCES Employees(NIF)
);

-- Create Suppliers Table (R6)
CREATE TABLE Suppliers (
    SupplierID INTEGER PRIMARY KEY,
    Name TEXT,
    Address TEXT,
    Number TEXT,
    ContactDetails TEXT,
    UNIQUE (SupplierID)
);

-- Create Affiliations Table (R7)
CREATE TABLE Affiliations (
    AffiliationID INTEGER PRIMARY KEY,
    SaleID INTEGER,
    UNIQUE (AffiliationID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

-- Create MarketingCampaigns Table (R8)
CREATE TABLE MarketingCampaigns (
    CampaignID INTEGER PRIMARY KEY,
    DiscountPercentage REAL,
    Channel TEXT,
    UNIQUE (CampaignID)
);

-- Create ProductInCampaigns Table (R9)
CREATE TABLE ProductInCampaigns (
    CampaignID INTEGER,
    ProductID INTEGER,
    PRIMARY KEY (CampaignID, ProductID),
    UNIQUE (CampaignID, ProductID),
    FOREIGN KEY (CampaignID) REFERENCES MarketingCampaigns(CampaignID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create SACCalls Table (R10)
CREATE TABLE SACCalls (
    CallID INTEGER PRIMARY KEY,
    Protocol TEXT,
    DegreeOfUrgency TEXT,
    ShortDescription TEXT,
    CustomerNIF INTEGER,
    UNIQUE (CallID),
    FOREIGN KEY (CustomerNIF) REFERENCES Customers(NIF)
);

-- Create Ratings Table (R11)
CREATE TABLE Ratings (
    RatingID INTEGER PRIMARY KEY,
    ProductID INTEGER,
    Stars INTEGER,
    Comments TEXT,
    UNIQUE (RatingID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Exchanges Table (R12)
CREATE TABLE Exchanges (
    ExchangeID INTEGER PRIMARY KEY,
    OriginalProductID INTEGER,
    NewProductID INTEGER,
    UNIQUE (ExchangeID),
    FOREIGN KEY (OriginalProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (NewProductID) REFERENCES Products(ProductID)
);
