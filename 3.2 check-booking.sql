use little_lemon;

CREATE PROCEDURE 'CheckBooking'(booking_date DATE, TableNumber INT)
BEGIN
DECLARE bookedTable INT DEFAULT 0;
 SELECT COUNT(bookedTable)
    INTO bookedTable
    FROM Bookings WHERE date = booking_date and table_number = TableNumber;
    IF bookedTable > 0 THEN
      SELECT CONCAT( "Table", TableNumber, "is already booked") AS "Booking status";
      ELSE 
      SELECT CONCAT( "Table", TableNumber, "is not booked") AS "Booking status";
    END IF;
END