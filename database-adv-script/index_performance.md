# 🔹 User Table – High-Usage Columns
## user_id	Frequently used in JOIN (e.g., Booking, Review, Message)
## email	Common in WHERE for login/authentication
## role	Used in WHERE to filter by role (guest/host)

# 🔹 Booking Table – High-Usage Columns
## booking_id	Used in JOIN (e.g., Payment) and WHERE
## user_id	Used in JOIN with User, and filters like "bookings per user"
## property_id	Used in JOIN with Property, analytics by property
## status_code	Often filtered in WHERE (e.g., confirmed only)
## start_date, end_date	Used in WHERE and availability searches

# 🔹 Property Table – High-Usage Columns
## property_id	Used in most JOIN clauses (Booking, Review)
## host_id	Filter by host or JOIN with User
## location_id	Filter by location (e.g., city/country search)
## price_per_night	Used in price filters/sorting

