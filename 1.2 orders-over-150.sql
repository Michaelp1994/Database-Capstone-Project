use little_lemon;

SELECT customers.id, customers.name, orders.id, orders.total_cost, menu_items.name, 
FROM orders
LEFT JOIN customers ON customers.id = orders.id,
LEFT JOIN order_items ON orders.id = order_items.orders_id,
LEFT JOIN menu_items ON menu_items.id = order_items.menu_items_id,
WHERE
    orders.total_cost > 150;