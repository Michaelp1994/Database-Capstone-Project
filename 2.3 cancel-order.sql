use little_lemon;


DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DELETE FROM Orders WHERE id = orderId;
END //

DELIMITER ;

CALL CancelOrder(5);