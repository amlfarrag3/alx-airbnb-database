
-- Recreate the Booking_ table with RANGE partitioning on start_date
CREATE TABLE Booking (
    booking_id     CHAR(36) PRIMARY KEY,
    property_id    CHAR(36) NOT NULL,
    user_id        CHAR(36) NOT NULL,
    start_date     DATE NOT NULL,
    end_date       DATE NOT NULL,
    total_price    DECIMAL(10,2) NOT NULL,
    status         ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key constraints (optional, can't be enforced on partitioned tables in MySQL <= 8.0.13)
    -- FOREIGN KEY (property_id) REFERENCES Property(property_id),
    -- FOREIGN KEY (user_id) REFERENCES User(user_id)
    
    INDEX idx_property_id (property_id),
    INDEX idx_user_id (user_id),
    INDEX idx_start_date (start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax  VALUES LESS THAN MAXVALUE
);

-- Test queries to measure performance improvement
EXPLAIN ANALYZE
SELECT b.id, u.first_name, u.last_name, p.name, p.type, py.payment_method, py.status
FROM bookings_partitioned b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments py ON b.id = py.booking_id
WHERE b.start_date BETWEEN '2025-04-01' AND '2025-06-31'
ORDER BY b.start_date;
-- Compare with the original table
EXPLAIN ANALYZE
SELECT b.id, u.first_name, u.last_name, p.name, p.type, py.payment_method, py.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments py ON b.id = py.booking_id
WHERE b.start_date BETWEEN '2025-04-01' AND '2023-06-31'
ORDER BY b.start_date;
