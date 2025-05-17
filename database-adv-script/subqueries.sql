-- Find All Properties with Average Rating > 4.0 (Using a Subquery)
SELECT 
    property_id,
    name,
    description,
    price_per_night
FROM 
    Property
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            Review
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );
--  Correlated Subquery to Find Users with More Than 3 Bookings
SELECT 
    user_id,
    first_name,
    last_name,
    email
FROM 
    User u
WHERE 
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;
