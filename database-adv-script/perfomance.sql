-- Query that retrieves all bookings along with the user details, property details, and payment details

EXPLAIN ANALYZE
SELECT booking.booking_id, user.first_name, user.last_name, property.name, property.description, payment.payment_method, payment.status
FROM bookings 
INNER JOIN users  ON booking.user_id = user.id
INNER JOIN properties  ON booking.property_id = property.id
INNER JOIN payments  ON booking.id = payment.booking_id
WHERE booking.status = 'confirmed'
    AND pyment.status = 'completed'
ORDER BY booking.booking_id;
