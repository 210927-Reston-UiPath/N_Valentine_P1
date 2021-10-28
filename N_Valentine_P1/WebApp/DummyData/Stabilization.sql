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



insert into ShoppingListProducts (name) values
    ('chang'),
    ('ipoh coffee'),
    ('milk'),
    ('bread'),
    ('veggie spread'),
    ('sasquatch ale'),
    ('gula malacca'),
    ('rain jacket');

insert into shoppinglists values
    (1, 1, 2),
    (1, 2, 3),
    (2, 3, 2),
    (2, 4, 4),
    (2, 5, 2),
    (3, 6, 12),
    (3, 7, 3),
    (3, 8, 6);