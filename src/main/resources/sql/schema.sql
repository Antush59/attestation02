create table if not exists "products"
(
    id_product   serial primary key,
    product_name text                           not null,
    cost         numeric(8, 2) check (cost > 0) not null,
    amount       integer check (amount > 0)   default 0  not null
);

create table if not exists buyers
(
    id_buyer   serial primary key,
    buyer_name text not null
);

create table if not exists "orders"
(
    id_orders serial primary key,
    products_id     integer references products (id_product) ON DELETE SET NULL,
    buyers_id       integer references buyers (id_buyer) ON DELETE SET NULL,
    purchase_date   date    not null,
    quantity integer
);

insert into products (product_name, cost, amount)
values ('Картошка', '39.5', 46),
       ('Помидоры', '95.3', 32),
       ('Огурцы', '87.0', 17),
       ('Масло', '142.4', 9),
       ('Молоко', '91.5', 40),
       ('Кефир', '84.3', 32),
       ('Минералка', '43', 18),
       ('Хлеб', '45.7', 36),
       ('Печенье', '93.6', 27),
       ('Балтика9', '85', 127);

insert into buyers (buyer_name)
values ('Александр Колчак'),
       ('Владимир Ленин'),
       ('Иосиф Сталин'),
       ('Лаврентий Берия'),
       ('Никита Хрущев'),
       ('Леонид Брежнев'),
       ('Юрий Андропов'),
       ('Константин Черченко'),
       ('Михаил Горбачев'),
       ('Борис Ельцин');

insert into orders (products_id, buyers_id, purchase_date, quantity)
values ((select id_product from products where product_name = 'Помидоры'),
        (select id_buyer from buyers where buyer_name = 'Владимир Ленин'),
        '2024-02-12', '4'),
       ((select id_product from products where product_name = 'Картошка'),
        (select id_buyer from buyers where buyer_name = 'Юрий Андропов'),
        '2022-05-25', '3'),
       ((select id_product from products where product_name = 'Огурцы'),
        (select id_buyer from buyers where buyer_name = 'Леонид Брежнев'),
        '2023-03-01', '2'),
       ((select id_product from products where product_name = 'Минералка'),
        (select id_buyer from buyers where buyer_name = 'Константин Черченко'),
        '2024-07-12', '1'),
       ((select id_product from products where product_name = 'Хлеб'),
        (select id_buyer from buyers where buyer_name = 'Константин Черченко'),
        '2021-03-15', '3'),
       ((select id_product from products where product_name = 'Печенье'),
        (select id_buyer from buyers where buyer_name = 'Борис Ельцин'),
        '2020-02-14', '5'),
       ((select id_product from products where product_name = 'Кефир'),
        (select id_buyer from buyers where buyer_name = 'Михаил Горбачев'),
        '2021-08-11', '1'),
       ((select id_product from products where product_name = 'Кефир'),
        (select id_buyer from buyers where buyer_name = 'Никита Хрущев'),
        '2021-12-21', '2'),
       ((select id_product from products where product_name = 'Масло'),
        (select id_buyer from buyers where buyer_name = 'Лаврентий Берия'),
        '2020-11-02', '1'),
       ((select id_product from products where product_name = 'Молоко'),
        (select id_buyer from buyers where buyer_name = 'Александр Колчак'),
        '2024-06-26', '6');

