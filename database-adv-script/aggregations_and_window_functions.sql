/* A query to find the total number of bookings made by each user,
   using the COUNT function and GROUP BY clause
*/
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    "User" AS u
JOIN 
    Booking AS b 
    ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;


-- Rank properties by total number of bookings using RANK 
SELECT 
    prop.property_id,
    prop.name,
    prop.location,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property AS prop
LEFT JOIN 
    Booking AS b 
    ON prop.property_id = b.property_id
GROUP BY 
    prop.property_id, prop.name;
