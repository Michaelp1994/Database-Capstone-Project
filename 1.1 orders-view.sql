use little_lemon;

create view OrdersView as
SELECT id, quantity, total_cost
FROM orders
WHERE
    quantity > 2;

Select * from OrdersView;