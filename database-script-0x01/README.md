
# 📦 Database Schema Overview

This project includes a normalized and relational SQL database schema designed to support the core functionalities of an Airbnb Clone backend system. The schema adheres to Third Normal Form (3NF) to eliminate redundancy and ensure data integrity.

## 🧱 Key Features

- **Users Table**: Stores information about all users including guests, hosts, and admins.
- **Properties Table**: Tracks properties listed by hosts, including details like location, pricing, and descriptions.
- **Bookings Table**: Records reservations made by users for specific properties, with status tracking.
- **Payments Table**: Handles payments tied to bookings, supporting multiple methods like credit card, PayPal, and Stripe.
- **Reviews Table**: Stores user feedback and ratings for properties.
- **Messages Table**: Supports internal messaging between users (e.g., host and guest communication).

## 🔐 Integrity & Performance

- **UUIDs** are used as primary keys for uniqueness across distributed systems.
- **Foreign keys** enforce referential integrity between tables.
- **Indexes** on commonly queried fields (e.g., `email`, `property_id`, `user_id`) enhance lookup speed.
- **Constraints** such as `CHECK` enforce data quality on fields like role, status, rating, and payment method.

This structure ensures that the backend can efficiently handle user authentication, property listings, booking workflows, payments, messaging, and reviews with optimal performance and scalability.
