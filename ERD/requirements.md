# 📘 Entity-Relationship Overview

This document outlines all entities, their attributes, and the relationships between them for the Airbnb Clone backend.

---

## 🧑‍💼 Entity: User

Represents a person who can act as a guest, host, or admin.

### Attributes:
- `user_id` (UUID, Primary Key)
- `first_name` (VARCHAR, Not Null)
- `last_name` (VARCHAR, Not Null)
- `email` (VARCHAR, Unique, Not Null)
- `password_hash` (VARCHAR, Not Null)
- `phone_number` (VARCHAR, Nullable)
- `role` (ENUM: guest, host, admin, Not Null)
- `created_at` (TIMESTAMP, Default: CURRENT_TIMESTAMP)

---

## 🏠 Entity: Property

Represents a property listed by a host for rent.

### Attributes:
- `property_id` (UUID, Primary Key)
- `host_id` (UUID, Foreign Key → User.user_id)
- `name` (VARCHAR, Not Null)
- `description` (TEXT, Not Null)
- `location` (VARCHAR, Not Null)
- `price_per_night` (DECIMAL, Not Null)
- `created_at` (TIMESTAMP, Default: CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, Auto-updated on modification)

---

## 📅 Entity: Booking

Represents a reservation made by a user for a property.

### Attributes:
- `booking_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property.property_id)
- `user_id` (UUID, Foreign Key → User.user_id)
- `start_date` (DATE, Not Null)
- `end_date` (DATE, Not Null)
- `total_price` (DECIMAL, Not Null)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at` (TIMESTAMP, Default: CURRENT_TIMESTAMP)

---

## 💳 Entity: Payment

Represents a payment made for a booking.

### Attributes:
- `payment_id` (UUID, Primary Key)
- `booking_id` (UUID, Foreign Key → Booking.booking_id)
- `amount` (DECIMAL, Not Null)
- `payment_date` (TIMESTAMP, Default: CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe)

---

## 🌟 Entity: Review

Represents a review written by a user for a property.

### Attributes:
- `review_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property.property_id)
- `user_id` (UUID, Foreign Key → User.user_id)
- `rating` (INTEGER, 1-5, Not Null)
- `comment` (TEXT, Not Null)
- `created_at` (TIMESTAMP, Default: CURRENT_TIMESTAMP)

---

## 💬 Entity: Message

Represents a message exchanged between users.

### Attributes:
- `message_id` (UUID, Primary Key)
- `sender_id` (UUID, Foreign Key → User.user_id)
- `recipient_id` (UUID, Foreign Key → User.user_id)
- `message_body` (TEXT, Not Null)
- `sent_at` (TIMESTAMP, Default: CURRENT_TIMESTAMP)

---

## 🔗 Relationships

- **User ↔ Property**: One host (User) can list many Properties.
- **User ↔ Booking**: One guest (User) can make many Bookings.
- **Property ↔ Booking**: One Property can have many Bookings.
- **Booking ↔ Payment**: One Booking has one Payment.
- **User ↔ Review**: One User can write many Reviews.
- **Property ↔ Review**: One Property can have many Reviews.
- **User ↔ Message**: One User can send and receive many Messages (sender_id and recipient_id).

---
 
