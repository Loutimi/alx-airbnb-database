-- 1st step: Renaming the original table
ALTER TABLE "Booking" RENAME TO booking_old;


-- 2nd step: Create a new partitioned Booking table
CREATE TABLE "Booking" (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price NUMERIC(10, 2),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES "Property"(property_id)
) PARTITION BY RANGE (start_date);


-- 3rd step: Create partitions (yearly)
CREATE TABLE booking_2025_01 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE booking_2025_02 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE booking_2025_03 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

CREATE TABLE booking_2025_04 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-04-01') TO ('2025-05-01');

CREATE TABLE booking_2025_05 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-05-01') TO ('2025-06-01');

CREATE TABLE booking_2025_06 PARTITION OF "Booking"
    FOR VALUES FROM ('2025-06-01') TO ('2025-07-01');


/* 4th step: Any rows with start_date that don’t match existing partitions
   will go into this default bucket.
*/
CREATE TABLE booking_default PARTITION OF "Booking"
    DEFAULT;


-- 5th step: Migrate data from booking_old into new Booking
INSERT INTO "Booking" (
    booking_id, user_id, property_id, start_date, end_date,
    total_price, status, created_at
)
SELECT 
    booking_id, user_id, property_id, start_date, end_date,
    total_price, status, created_at
FROM booking_old;


-- 6th step: Drop the old table after verification
DROP TABLE booking_old;
