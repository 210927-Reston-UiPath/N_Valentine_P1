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