-- ============================================
-- Performance Test: User Email Lookup
-- ============================================

-- Drop index if it already exists
DROP INDEX IF EXISTS idx_user_email;

-- Step 1: Run query without index (cold test)
EXPLAIN ANALYZE
SELECT * FROM "User"
WHERE email = 'test@example.com';

-- Step 2: Create index on email
CREATE UNIQUE INDEX idx_user_email ON "User"(email);

-- Step 3: Run same query again with index
EXPLAIN ANALYZE
SELECT * FROM "User"
WHERE email = 'test@example.com';



-- ============================================
-- Performance Test: Booking Table JOIN
-- ============================================

-- Drop index if exists
DROP INDEX IF EXISTS idx_booking_property_id;

-- Step 1: Join query without index
EXPLAIN ANALYZE
SELECT b.*
FROM "Booking" b
JOIN "Property" p ON b.property_id = p.property_id
WHERE p.location = 'Lagos';

-- Step 2: Create index on property_id in Booking
CREATE INDEX idx_booking_property_id ON "Booking"(property_id);

-- Step 3: Run the same query again
EXPLAIN ANALYZE
SELECT b.*
FROM "Booking" b
JOIN "Property" p ON b.property_id = p.property_id
WHERE p.location = 'Lagos';



-- ============================================
-- Original Index Definitions (for deployment)
-- ============================================

-- User Table
CREATE INDEX IF NOT EXISTS idx_user_id ON "User"(user_id);

-- Booking Table
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON "Booking"(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_dates ON "Booking"(start_date, end_date);

-- Property Table
CREATE INDEX IF NOT EXISTS idx_property_id ON "Property"(property_id);
CREATE INDEX IF NOT EXISTS idx_property_location ON "Property"(location);
CREATE INDEX IF NOT EXISTS idx_property_price ON "Property"(pricepernight);
