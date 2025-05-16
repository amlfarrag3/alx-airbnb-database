INSERT INTO Location (location_id, city, country)
VALUES
  ('loc-001', 'New York', 'USA'),
  ('loc-002', 'Paris', 'France'),
  ('loc-003', 'Lagos', 'Nigeria');

-- Sample User Data

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('user-001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pwd1', '1234567890', 'host'),
  ('user-002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pwd2', '2345678901', 'guest'),
  ('user-003', 'Carol', 'White', 'carol@example.com', 'hashed_pwd3', '3456789012', 'guest'),
  ('user-004', 'Dave', 'Brown', 'dave@example.com', 'hashed_pwd4', '4567890123', 'host');

-- Sample Property Data

INSERT INTO Property (property_id, host_id, name, description, location_id, price_per_night)
VALUES
  ('prop-001', 'user-001', 'Cozy Apartment in NYC', 'Nice and cozy with central heating', 'loc-001', 120.00),
  ('prop-002', 'user-004', 'Paris Loft', 'Modern loft near the Eiffel Tower', 'loc-002', 180.00),
  ('prop-003', 'user-001', 'Lagos Beach House', 'Spacious beachfront house', 'loc-003', 100.00);

-- Sample BookingStatus Data

INSERT INTO BookingStatus (status_code, description)
VALUES
  ('pending', 'Booking is awaiting confirmation'),
  ('confirmed', 'Booking has been confirmed'),
  ('canceled', 'Booking was canceled by user or host');

-- Sample Booking Data

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status_code)
VALUES
  ('book-001', 'prop-001', 'user-002', '2025-06-01', '2025-06-05', 'confirmed'),
  ('book-002', 'prop-002', 'user-003', '2025-06-10', '2025-06-15', 'pending'),
  ('book-003', 'prop-003', 'user-002', '2025-07-01', '2025-07-03', 'canceled');

-- Sample Payment Data

INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay-001', 'book-001', 480.00, 'credit_card'),
  ('pay-002', 'book-002', 900.00, 'paypal');

-- Sample Review Data

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('rev-001', 'prop-001', 'user-002', 5, 'Amazing stay, very clean and convenient.'),
  ('rev-002', 'prop-003', 'user-002', 4, 'Great beachfront location, a bit noisy at night.');

-- 8. Sample Message Data

INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('msg-001', 'user-002', 'user-001', 'Hi Alice, is the apartment available from June 1st?'),
  ('msg-002', 'user-001', 'user-002', 'Yes, it’s available. I’ll confirm your booking.');
