-- a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status_code,
    Booking.created_at AS booking_created_at,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;

-- a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.price_per_night,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at AS review_date
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id;
ORDER BY property_id;

--  a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.status_code,
    Booking.created_at AS booking_created_at
FROM
    User
FULL OUTER JOIN
    Booking ON User.user_id = Booking.user_id;


