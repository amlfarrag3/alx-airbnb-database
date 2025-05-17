-- user table
-- Already exists if PRIMARY KEY
-- CREATE UNIQUE INDEX idx_user_id ON User(user_id);

CREATE UNIQUE INDEX idx_user_email ON User(email);

-- index for role filtering (e.g., WHERE role = 'host')
CREATE INDEX idx_user_role ON User(role);

-- Booking Table
-- Already exists if PRIMARY KEY
-- CREATE UNIQUE INDEX idx_booking_id ON Booking(booking_id);

CREATE INDEX idx_booking_user_id ON Booking(user_id);

CREATE INDEX idx_booking_property_id ON Booking(property_id);

CREATE INDEX idx_booking_status_code ON Booking(status_code);

-- Composite index to support availability checks
CREATE INDEX idx_booking_availability 
ON Booking(property_id, start_date, end_date);

-- Property Table
-- Already exists if PRIMARY KEY
-- CREATE UNIQUE INDEX idx_property_id ON Property(property_id);

CREATE INDEX idx_property_host_id ON Property(host_id);

-- Assuming a location column exists, such as city or region
-- CREATE INDEX idx_property_location ON Property(location);

CREATE INDEX idx_property_price ON Property(price_per_night);

-- Check analysis of the database after creating indexs
EXPLAIN ANALYZE property_calender;
