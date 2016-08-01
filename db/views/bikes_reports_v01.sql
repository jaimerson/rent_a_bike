SELECT
  bikes.name, bikes.model,
  count(rentals.id) as times_rented,
  round(SUM(extract(
        epoch from (rentals.returned_at - rentals.created_at)
  )/ 3600 * bikes.price)::numeric, 2) as revenue
  FROM
  rentals INNER JOIN bikes ON bikes.id = rentals.bike_id
  GROUP BY bikes.id
  ORDER BY times_rented DESC;
