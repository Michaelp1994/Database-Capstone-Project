DELIMITER //
use little_lemon;
CREATE PROCEDURE AddValidBooking(
    IN bookingDate DATE,
    IN tableNumber INT,
    IN customerName VARCHAR(255)
)
BEGIN
    DECLARE @existingBookingCount INT;

    -- Check if the table is already booked
    SELECT COUNT(*) INTO @existingBookingCount
    FROM Bookings
    WHERE BookingDate = bookingDate AND TableNumber = tableNumber;

      -- Start a transaction
    START TRANSACTION;

    IF @existingBookingCount > 0 THEN
        -- The table is already booked, so rollback the transaction
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Table is already booked for this date.';
    ELSE
        -- The table is available, so insert the new booking
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerName)
        VALUES (bookingDate, tableNumber, customerName);

        -- Commit the transaction
        COMMIT;
    END IF;
END //

DELIMITER ;