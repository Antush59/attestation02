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

