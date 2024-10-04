select * from buyers;

select * from products where amount < 40;

select * from orders where purchase_date > '2022-01-01' and quantity > 1;

update products set cost = cost * 1.2 where cost < 50.0;

update buyers set buyer_name = 'Иван Грозный' where id_buyer = 8;

update orders set quantity = quantity - 2 where mod(id_orders,2) = 0 and quantity > 1;

delete from orders where purchase_date < '2021-01-01';

delete from buyers where length(buyer_name) < 15;

delete from products where cost < 50;