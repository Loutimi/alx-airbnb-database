-- 🧑‍💼 USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('11111111-1111-1111-1111-111111111111', 'Wayne', 'Rooney', 'wayne@example.com', 'hashed_pw_1', '08012345678', 'host'),
('22222222-2222-2222-2222-222222222222', 'Ade', 'Thomas', 'ade@example.com', 'hashed_pw_2', '08123456789', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Obi', 'Ogbonna', 'obi@example.com', 'hashed_pw_3', '09087654321', 'admin');

-- 🏠 PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
('aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Seaside Villa', 'Cozy beachside home with 3 beds', 'Lagos', 250000.00),
('aaaa2222-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'City Apartment', 'Modern apartment in city center', 'Abuja', 50000.00);

-- 📅 BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbb1111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-07-01', '2025-07-05', 1000000.00, 'confirmed'),
('bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaa2222-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', '2025-07-10', '2025-07-12', 100000.00, 'pending');

-- 💳 PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('cccc1111-cccc-cccc-cccc-cccccccccccc', 'bbbb1111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1200.00, 'credit_card'),
('cccc2222-cccc-cccc-cccc-cccccccccccc', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 300.00, 'paypal');

-- 🌟 REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('dddd1111-dddd-dddd-dddd-dddddddddddd', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 5, 'Amazing experience! Highly recommend.'),
('dddd2222-dddd-dddd-dddd-dddddddddddd', 'aaaa2222-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 4, 'Nice place, could use better Wi-Fi.');

-- 💬 MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('eeee1111-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi, is the Seaside Villa available for July 1st?'),
('eeee2222-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Yes, it is available. You can proceed to book.');

 
