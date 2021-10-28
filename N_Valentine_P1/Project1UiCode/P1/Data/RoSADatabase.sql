create table Vendors(
    id serial not null,
    name varchar(30),
    primary key(id)
);
insert into Vendors (name) values ('(no vendor)');

drop table Vendors;



create table VendorAccess(
    id integer not null,
    username varchar(30),
    password varchar(30),
    primary key(id, username, password),
    constraint fk_vendorId
        foreign key(id)
            references Vendors(id)
);

drop table VendorAccess;



create table Clients (
    id serial not null,
    firstName varchar(30),
    lastName varchar(30),
    email varchar(30),
    primary key(id)
);

drop table clients;



create table ShoppingLists(
    clientId integer not null,
    product varchar(30) not null,
    quantity integer not null,
    primary key(clientId, product, quantity),
    constraint fk_clientId
        foreign key(clientId)
            references Clients(id)
            on delete cascade
);

drop table ShoppingLists;



create table OrderReference(
    orderId serial,
    clientId integer not null,
    total numeric,
    primary key(orderId),
    constraint fk_clientId
        foreign key(clientId)
            references Clients(id)
);

drop table OrderReference;



create table OrderDetails(
    itemId serial not null,
    orderId integer not null,
    product varchar(30) not null,
    quantity integer not null,
    price numeric not null,
    discountNet numeric not null,
    vendorId integer not null,
    status varchar(30) not null,
    primary key(itemId),
    constraint fk_orderId
        foreign key(id)
            references OrderReference(orderId),
    constraint fk_vendorId
        foreign key(vendorId)
            references Vendors(id)
);

drop table OrderDetails;



select * from Vendors;
select * from VendorAccess;
select * from Clients;
select * from ShoppingLists;
select * from OrderReference;
select * from Orders;

create table ShoppingTrips(
    id serial not null,
    total numeric not null,
    date timestamp not null,
    primary key(id)
);

select * from ShoppingTrips;


truncate table ShoppingTrips;


create table ShoppingTripItems(
    id serial not null,
    shoppingTripId integer not null,
    productId integer not null,
    quantity integer not null,
    price numeric not null,
    discountComplement numeric not null,
    vendorId integer not null,
    status varchar(30) not null,
    primary key(id),
    constraint fk_shoppingTripId
        foreign key(shoppingTripId)
            references ShoppingTrips(id),
    constraint fk_productId
        foreign key(productId)
            references ShoppingListProducts(id),
    constraint fk_vendorId
        foreign key(vendorId)
            references Vendors(id)
);

select * from ShoppingTripItems;

select * from Vendors;
select * from VendorAccess;

drop table Vendors;
drop table VendorAccess;
drop table Orders;

insert into Vendors (name) values ('pega store');
insert into VendorAccess values (2, 'shopper0', 'Shopper0');



select * from Clients;
select * from ShoppingLists;

insert into Clients (firstName, lastName, email)
    values ('Lugato', 'Nderu', 'LugoNderu@email.com');
insert into Clients (firstName, lastName, email)
    values ('Chotozaru', 'Nderu', 'ChotoNderu@email.com');
insert into Clients (firstName, lastName, email)
    values ('Raikhozho', 'Kowalczyk', 'RaikoK@email.com');

insert into shoppinglists values


select * from Vendors;
select * from VendorAccess;
select * from Clients;
select * from ShoppingListProducts;
select * from ShoppingLists;
select * from Orders;
select * from OrderDetails;


alter table Orders rename to OrderDetails;
alter table OrderReference rename to Orders;



drop table OrderDetails;

create table OrderDetails(
    itemId serial not null,
    orderId integer not null,
    product varchar(30) not null,
    quantity integer not null,
    price numeric not null,
    discountNet numeric not null,
    vendorId integer not null,
    status varchar(30) not null,
    primary key(itemId),
    constraint fk_orderId
        foreign key(orderId)
            references Orders(orderId),
    constraint fk_vendorId
        foreign key(vendorId)
            references Vendors(id)
);



alter table Orders
    add column date date not null;



create table ShoppingListProducts(
    id serial not null,
    name varchar(30),
    primary key(id)
);



drop table ShoppingLists;

create table ShoppingLists(
    clientId integer not null,
    productId integer not null,
    quantity integer not null,
    primary key(clientId, productId, quantity),
    constraint fk_clientId
        foreign key(clientId)
            references Clients(id)
            on delete cascade,
    constraint fk_productId
        foreign key(productId)
            references ShoppingListProducts(id)
);

select productId, quantity, price, discountComplement, vendorId, status from ShoppingTripItems where id is null;

select * from ShoppingTrips;

insert into ShoppingTrips (total, date)
    values (-78, CURRENT_TIMESTAMP);

delete from ShoppingTrips where id < 11;

select max(id) from ShoppingTrips;


select * from Vendors;


select * from ShoppingTripItems;

delete from ShoppingTripItems where shoppingTripId < 11;



select * from Clients;

select * from Orders;

drop table Orders;

select * from OrderDetails;

drop table OrderDetails;



create table Orders(
    id serial not null,
    shoppingTripId integer not null,
    clientId integer not null,
    total numeric,
    primary key(id),
    constraint fk_shoppingTripId
        foreign key(shoppingTripId)
            references ShoppingTrips(id),
    constraint fk_clientId
        foreign key(clientId)
            references Clients(id)
);

create table OrderDetails(
    id serial not null,
    orderId integer not null,
    productId integer not null,
    quantity integer,
    price numeric,
    discount numeric,
    subTotal numeric,
    vendorId integer not null,
    status varchar(30),
    primary key(id),
    constraint fk_orderId
        foreign key(orderId)
            references Orders(id),
    constraint fk_productId
        foreign key(productId)
            references ShoppingListProducts(id),
    constraint fk_vendorId
        foreign key(vendorId)
            references Vendors(id)
);



select * from Clients;
select * from ShoppingLists;
select * from ShoppingListProducts;

select * from Clients;
select * from ShoppingLists;
select * from ShoppingListProducts;

select * from Orders;
select * from OrderDetails;

select * from ShoppingTrips;
select * from ShoppingTripItems;

select * from Vendors;
select * from VendorAccess;

delete from Clients where id > 3;
delete from ShoppingListProducts where id > 8;

truncate table OrderDetails;
delete from Orders where id > 0;