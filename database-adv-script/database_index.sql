-- ======================
--  User Table: Indexes
-- ======================

-- Enforce uniqueness and improve lookup speed on email
CREATE UNIQUE INDEX idx_user_email ON "User"(email);

-- Speed up joins and filtering on user_id
CREATE INDEX idx_user_id ON "User"(user_id);


-- ==========================
--  Booking Table: Indexes
-- ==========================

-- Join optimization: commonly joined with Property
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);

-- Join optimization: commonly joined with User
CREATE INDEX idx_booking_user_id ON "Booking"(user_id);

-- For efficient date range queries (e.g., availability searches)
CREATE INDEX idx_booking_dates ON "Booking"(start_date, end_date);


-- ===========================
-- Property Table: Indexes
-- ===========================

-- Join optimization
CREATE INDEX idx_property_id ON "Property"(property_id);

-- Filtering by city/area
CREATE INDEX idx_property_location ON "Property"(location);

-- Filtering or sorting by price
CREATE INDEX idx_property_price ON "Property"(pricepernight);
