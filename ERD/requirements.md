# Database Specification - AirBnB
## Entities and Attributes
### User
#### user_id: Primary Key, UUID, Indexed
#### first_name: VARCHAR, NOT NULL
#### last_name: VARCHAR, NOT NULL
#### email: VARCHAR, UNIQUE, NOT NULL
#### password_hash: VARCHAR, NOT NULL
#### phone_number: VARCHAR, NULL
#### role: ENUM (guest, host, admin), NOT NULL
#### created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
### Property
#### property_id: Primary Key, UUID, Indexed
#### host_id: Foreign Key, references User(user_id)
#### name: VARCHAR, NOT NULL
#### description: TEXT, NOT NULL
#### location: VARCHAR, NOT NULL
#### pricepernight: DECIMAL, NOT NULL
#### created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
#### updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
### Booking
#### booking_id: Primary Key, UUID, Indexed
#### property_id: Foreign Key, references Property(property_id)
#### user_id: Foreign Key, references User(user_id)
#### start_date: DATE, NOT NULL
#### end_date: DATE, NOT NULL
#### total_price: DECIMAL, NOT NULL
#### status: ENUM (pending, confirmed, canceled), NOT NULL
#### created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
### Payment
#### payment_id: Primary Key, UUID, Indexed
#### booking_id: Foreign Key, references Booking(booking_id)
#### amount: DECIMAL, NOT NULL
#### payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
#### payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
### Review
#### review_id: Primary Key, UUID, Indexed
#### property_id: Foreign Key, references Property(property_id)
#### user_id: Foreign Key, references User(user_id)
#### rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
#### comment: TEXT, NOT NULL
#### created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
### Message
#### message_id: Primary Key, UUID, Indexed
#### sender_id: Foreign Key, references User(user_id)
#### recipient_id: Foreign Key, references User(user_id)
#### message_body: TEXT, NOT NULL
#### sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## 🔗 Entity Relationships Overview
### 1. User Table Connected to:

#### Property via host_id (a user can be a host who owns properties)

#### Booking via user_id (a user can make bookings)

#### Review via user_id (a user can leave reviews)

#### Message via sender_id and recipient_id (a user can send/receive messages)

### 2. Property Table Connected to:

#### User via host_id (foreign key to User.id)

#### Booking via property_id (a property can be booked many times)

#### Review via property_id (a property can have many reviews)

### 3. Booking Table Connected to:

#### User via user_id (guest who made the booking)

#### Property via property_id (which property is booked)

#### Payment via booking_id (each booking can have a payment)

### 4. Payment Table Connected to:

#### Booking via booking_id (ensures payment is for a valid booking)

### 5. Review Table Connected to:

#### User via user_id (who wrote the review)

#### Property via property_id (which property was reviewed)

### 6. Message Table Connected to:

#### User via sender_id and recipient_id (both are users)



![443954994-b0c8f9b0-9962-4817-a03f-1998693ca3f4](https://github.com/user-attachments/assets/bae5dc49-c5ac-4931-a22d-4412ff781ad1)
