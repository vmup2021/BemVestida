-- Erase the tables if they already exist in the database
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS CUSTOMERSERVICE;
DROP TABLE IF EXISTS PROVIDER;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS SELL;
DROP TABLE IF EXISTS CLIENTSELLPRODUCT;
DROP TABLE IF EXISTS AVALIATION;
DROP TABLE IF EXISTS CLIENTAVALIATIONPRODUCT;
DROP TABLE IF EXISTS MARKETCAMPAIGN;
DROP TABLE IF EXISTS EXCHANGE;

-- Actually create the tables

CREATE TABLE DEPARTMENT(
    idDepartment INT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE CLIENT(
    NIF INT PRIMARY KEY,
    name VARCHAR,
    email VARCHAR,
    phone VARCHAR,
    address VARCHAR
);

CREATE TABLE EMPLOYEE(
    NIF INT PRIMARY KEY, 
    name VARCHAR,
    address VARCHAR,
    shift VARCHAR, 
    manager BOOLEAN,
    department INT,
    FOREIGN KEY (department) REFERENCES DEPARTMENT(idDepartment)
);

CREATE TABLE CUSTOMERSERVICE(
    idCustomerService INT PRIMARY KEY, 
    urgency INT, 
    description TEXT, 
    client INT,
    FOREIGN KEY (client) REFERENCES CLIENT(NIF)
);

CREATE TABLE PROVIDER(
    idProvider INT PRIMARY KEY,
    address VARCHAR,
    phone VARCHAR, 
    email VARCHAR,
    name VARCHAR
);

CREATE TABLE PRODUCT(
    idProduct INT PRIMARY KEY, 
    price FLOAT,
    stock INT,
    material VARCHAR,
    name VARCHAR,
    department INT,
    provider INT,
    FOREIGN KEY (department) REFERENCES DEPARTMENT(idDepartment),
    FOREIGN KEY (provider) REFERENCES PROVIDER(idProvider)
);

CREATE TABLE SELL(
    idSell INT PRIMARY KEY,
    price FLOAT, 
    date DATETIME, 
    payment_format VARCHAR,
    client INT,
    product INT,
    FOREIGN KEY (client) REFERENCES CLIENT(NIF),
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);

CREATE TABLE CLIENTSELLPRODUCT(
    client INT,
    sell INT,
    product INT,
    PRIMARY KEY (client, sell, product),
    FOREIGN KEY (client) REFERENCES CLIENT(NIF), 
    FOREIGN KEY (sell) REFERENCES SELL(idSell), 
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);

CREATE TABLE AVALIATION(
    idAvaliation INT PRIMARY KEY,
    stars INT,
    description TEXT,
    date DATETIME, 
    product INT,
    client INT,
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct),
    FOREIGN KEY (client) REFERENCES CLIENT(NIF)
);

CREATE TABLE CLIENTAVALIATIONPRODUCT(
    client INT,
    idAvaliation INT,
    product INT,
    PRIMARY KEY (client, idAvaliation, product),
    FOREIGN KEY (client) REFERENCES CLIENT(NIF),
    FOREIGN KEY (idAvaliation) REFERENCES AVALIATION(idAvaliation),
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);

CREATE TABLE MARKETCAMPAIGN(
    idMarketCampaign INT PRIMARY KEY, 
    discount FLOAT,
    channel VARCHAR,
    product INT,
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);

CREATE TABLE EXCHANGE(
    idExchange INT PRIMARY KEY,
    type INT,
    date DATETIME,
    product INT,
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);
