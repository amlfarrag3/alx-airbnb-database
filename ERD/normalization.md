# 🎯 Goal: Achieve Third Normal Form (3NF)
## 🔹 Step 1: First Normal Form (1NF)
### Rule: No repeating groups or arrays. Each field contains atomic values.

### ✅ Our schema already satisfies 1NF:

### All fields are atomic (e.g., no lists in columns like phone or payment_method).

### All rows are uniquely identified by primary keys.

## 🔹 Step 2: Second Normal Form (2NF)
### Rule: Be in 1NF, and no partial dependencies on a composite key.

### ✅ Since all tables have single-column primary keys, there are no partial dependencies to worry about.

## 🔍 Analysis & Adjustments for 3NF
## 🔸 User Table
### user_type might imply different behaviors (host vs. guest), but no transitive dependency. No change needed.
### ✅ 3NF Compliant

## 🔸 Property Table
### Let's say location is stored as a full string like "Lagos, Nigeria".

### If you're repeating the same city or country across many properties, it's redundant.
### ✅ Normalization Step:
### Create a Location table
### Location(location_id PK, city, country)
### Update Property:
### property_id (PK), host_id (FK), title, description, location_id (FK), price_per_night

## 🔸 Booking Table
### status (pending, confirmed, canceled) could be stored as raw text.

### ✅ Normalization Step (optional):
### If you expect to expand booking statuses (e.g., translated names, color codes), extract into:
### BookingStatus(status_code PK, description)
### Update Booking:
### booking_id (PK), user_id (FK), property_id (FK), booking_date, status_code (FK)

##🔸 Payment Table
### If payment_method is repeated (e.g., "Credit Card", "PayPal") across rows...

### ✅ Normalization Step:
### Create a PaymentMethod table:
### payment_method_id (PK), method_name
### Update Payment:
### payment_id (PK), booking_id (FK), amount, payment_date, payment_method_id (FK)

## 🔸 Review Table
### No transitive dependencies. Each review is clearly linked to a user and property.

### ✅ 3NF Compliant

## 🔸 Message Table
### No transitive dependencies. sender/recipient are users; content is atomic.

### ✅ 3NF Compliant
