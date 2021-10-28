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
    (1, 'chang', 2),
    (1, 'ipoh coffee', 3),
    (2, 'milk', 2),
    (2, 'bread', 4),
    (2, 'veggie spread', 2),
    (3, 'sasquatch ale', 12),
    (3, 'gula malacca', 3),
    (3, 'rain jacket', 6);