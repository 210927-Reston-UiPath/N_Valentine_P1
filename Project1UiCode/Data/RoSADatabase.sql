create table clients
( firstname varchar (100) not null,
  lastname varchar (100) not null,
  email varchar (100) not null 
  clientID serial primary key
);

create table OrderReference
(orderID serial,
email varchar (100),
total int 
);

create table vendors
( vendorName varchar (100)
);

create table products
( productName varchar (100),
  quantity int
);