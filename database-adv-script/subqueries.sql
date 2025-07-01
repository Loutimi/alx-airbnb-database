-- Non-Correlated Subquery to get properties with average rating > 4.0
SELECT 
    prop.property_id, 
    prop.name, 
    prop.location, 
    prop.pricepernight
FROM 
    Property as prop
WHERE 
    prop.property_id IN (
        SELECT 
            property_id
        FROM 
            Review
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );


-- A correlated subquery to find users who have made more than 3 bookings.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    "User" AS u
WHERE (
    SELECT COUNT(*)
    FROM "Booking" AS b
    WHERE b.user_id = u.user_id
) > 3;
