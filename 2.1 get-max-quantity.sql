use little_lemon;


CREATE PROCEDURE GetMaxQuantity()
SELECT max(quantity) AS "Max Quantity in Order" FROM orders


CALL GetMaxQuantity();