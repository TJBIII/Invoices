CREATE TABLE Customer (
    IdCustomer INT NOT NULL,
    FirstName  VARCHAR (55)  NOT NULL,
    LastName   VARCHAR (55) NOT NULL,
    StreetAddress  VARCHAR(255) NOT NULL,
    City VARCHAR(55)  NOT NULL,
    StateProvince VARCHAR (255) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdCustomer] ASC)
);

CREATE TABLE Product(
    IdProduct   INT  NOT NULL,
    Name  VARCHAR (55)  NOT NULL,
    Description  VARCHAR (255) NOT NULL,
	Price REAL  NOT NULL,
    IdProductType INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProduct] ASC),
);


CREATE TABLE ProductType(
    IdProductType INT           NOT NULL,
	Name VARCHAR (55)  NOT NULL,
    Description  VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdProductType] ASC)
);



CREATE TABLE OrderProducts(
  IdOrderProducts INT NOT NULL,
  IdProduct INT NOT NULL,
  IdOrder INT NOT NULL,
  PRIMARY KEY CLUSTERED (IdOrderProducts ASC)
);

CREATE TABLE CustomerOrder (
  IdOrder INT NOT NULL,
  OrderNumber VARCHAR(20) NOT NULL,
  DateCreated DATE NOT NULL,
  IdCustomer INT NOT NULL,
  IdPaymentOption INT NOT NULL,
  ShippingMethod VARCHAR(15) NOT NULL,
  PRIMARY KEY CLUSTERED (IdOrder ASC)
);

CREATE TABLE PaymentOption (
  IdPaymentOption INT NOT NULL,
  IdCustomer INT NOT NULL,
  Name VARCHAR(99) NOT NULL,
  AccountNumber VARCHAR(20) NOT NULL,
  PRIMARY KEY CLUSTERED (IdPaymentOption ASC)
);


ALTER TABLE OrderProducts 
  ADD CONSTRAINT [FK_OrderProducts_Order] 
  FOREIGN KEY ([IdOrder]) 
  REFERENCES [dbo].[CustomerOrder] ([IdOrder]);

ALTER TABLE Product
	ADD CONSTRAINT [FK_Product_ProductType] 
	FOREIGN KEY ([IdProductType]) 
	REFERENCES [dbo].[ProductType] ([IdProductType]);

ALTER TABLE OrderProducts 
  ADD CONSTRAINT [FK_OrderProducts_Product] 
  FOREIGN KEY ([IdProduct]) 
  REFERENCES [dbo].[Product] ([IdProduct]);

  
ALTER TABLE CustomerOrder 
  ADD CONSTRAINT [FK_CustomerOrder_Customer] 
  FOREIGN KEY ([IdCustomer]) 
  REFERENCES [dbo].[Customer] ([IdCustomer]);

  
ALTER TABLE CustomerOrder 
  ADD CONSTRAINT [FK_CustomerOrder_PaymentOptions] 
  FOREIGN KEY ([IdPaymentOption]) 
  REFERENCES [dbo].[PaymentOption] ([IdPaymentOption]);

  
ALTER TABLE PaymentOption 
  ADD CONSTRAINT [FK_PaymentOption_Customer] 
  FOREIGN KEY ([IdCustomer]) 
  REFERENCES [dbo].[Customer] ([IdCustomer]);
