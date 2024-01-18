use little_lemon;


SELECT menu_items.name
FROM menu_items
WHERE menu_items.id = ANY (
    SELECT order_items.menus_id
    FROM order_items
    GROUP BY order_items.id
    HAVING COUNT(*) > 2
);