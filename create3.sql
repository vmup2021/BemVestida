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
    name VARCHAR NOT NULL
);

CREATE TABLE CLIENT(
    NIF INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE EMPLOYEE(
    NIF INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    work_shift VARCHAR NOT NULL, 
    manager BOOLEAN DEFAULT FALSE,
    department INT,
    FOREIGN KEY (department) REFERENCES DEPARTMENT(idDepartment)
);

CREATE TABLE CUSTOMERSERVICE(
    idCustomerService INT PRIMARY KEY, 
    urgency INT CHECK (urgency >= 0 AND urgency <= 5), 
    description TEXT, 
    client INT,
    FOREIGN KEY (client) REFERENCES CLIENT(NIF)
);

CREATE TABLE PROVIDER(
    idProvider INT PRIMARY KEY,
    address VARCHAR(50),
    phone VARCHAR(20) NOT NULL, 
    email VARCHAR(50) NOT NULL,
    name VARCHAR
);

CREATE TABLE PRODUCT(
    idProduct INT PRIMARY KEY, 
    price FLOAT CHECK (price > 0.0),
    stock INT CHECK (stock > 0),
    material VARCHAR,
    name VARCHAR(50) NOT NULL,
    department INT, 
    provider INT,
    FOREIGN KEY (department) REFERENCES DEPARTMENT(idDepartment),
    FOREIGN KEY (provider) REFERENCES PROVIDER(idProvider)
);

CREATE TABLE SELL(
    idSell INT PRIMARY KEY,
    price FLOAT CHECK (price > 0.0), 
    date DATETIME NOT NULL, 
    payment_format VARCHAR NOT NULL,
    idClient INT,
    idProduct INT,
    FOREIGN KEY (idClient) REFERENCES CLIENT(NIF),
    FOREIGN KEY (idProduct) REFERENCES PRODUCT(idProduct)
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
    stars INT CHECK (stars >= 0 AND stars <= 5),
    description TEXT,
    date DATETIME NOT NULL, 
    product INT,
    client INT,
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct),
    FOREIGN KEY (client) REFERENCES CLIENT(NIF)
);

CREATE TABLE CLIENTAVALIATIONPRODUCT(
    client INT,
    avaliation INT,
    product INT,
    PRIMARY KEY (client, avaliation, product),
    FOREIGN KEY (client) REFERENCES CLIENT(NIF),
    FOREIGN KEY (avaliation) REFERENCES AVALIATION(idAvaliation),
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);

CREATE TABLE MARKETCAMPAIGN(
    idMarketCampaign INT PRIMARY KEY, 
    discount FLOAT CHECK (discount > 0.0 AND discount < 1.0),
    channel VARCHAR,
    product INT,
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);

CREATE TABLE EXCHANGE(
    idExchange INT PRIMARY KEY,
    type INT,
    date DATETIME NOT NULL,
    product INT,
    FOREIGN KEY (product) REFERENCES PRODUCT(idProduct)
);
