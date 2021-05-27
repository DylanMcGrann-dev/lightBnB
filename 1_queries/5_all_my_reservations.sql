
SELECT reservations.id as id,reservations.start_date as start_date, properties.title as title, 
properties.cost_per_night as cost_per_night,
AVG(property_reviews.rating) as average_rating,
properties.description as description
properties.parking_spaces as parking_spaces,
properties.number_of_bathrooms as number_of_bathrooms,
properties.number_of_bedrooms as number_of_bedrooms,
properties.country as country,
properties.street as street,
properties.province as province,
properties.post_code as post_code,
properties.active as active
FROM users 
JOIN reservations ON users.id = guest_id
JOIN properties ON properties.owner_id = reservations.guest_id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 991
GROUP BY reservations.id, properties.id
HAVING end_date < now()::DATE
ORDER BY reservations.start_date
LIMIT 10


--answer 
-- SELECT properties.*, reservations.*, avg(rating) as average_rating
-- FROM reservations
-- JOIN properties ON reservations.property_id = properties.id
-- JOIN property_reviews ON properties.id = property_reviews.property_id
-- WHERE reservations.guest_id = 1
-- AND reservations.end_date < now()::date
-- GROUP BY properties.id, reservations.id
-- ORDER BY reservations.start_date
-- LIMIT 10;