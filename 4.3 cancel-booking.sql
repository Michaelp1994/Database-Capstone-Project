use little_lemon;
DELIMITER //
CREATE PROCEDURE `CancelBooking`(IN booking_id_to_cancel INT)
BEGIN
    -- Delete the booking record
    DELETE FROM `Bookings`
    WHERE `BookingID` = booking_id_to_cancel;

    SELECT CONCAT('Booking ', booking_id_to_cancel, ' cancelled') AS 'Confirmation';
END;
//
DELIMITER ;