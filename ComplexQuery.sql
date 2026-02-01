SELECT 
    booking_rank AS "Rank",
    brand AS "Brand",
    total_bookings AS "Total Bookings"
FROM (
    SELECT 
        brand,
        total_bookings,
        unique_customers,
        brand_revenue,
        DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
    FROM (
        SELECT 
            brand,
            COUNT(car_id) AS total_bookings,
            COUNT(DISTINCT customer_id) AS unique_customers,
            SUM(daily_revenue) AS brand_revenue
        FROM (
            SELECT 
                c.car_id,
                c.brand,
                r.customer_id,
                r.price_per_day * (r.return_date - r.pickup_date) AS daily_revenue
            FROM "public"."car" c
            INNER JOIN "public"."Rental" r ON c.car_id = r.car_id
            WHERE r.rental_status = true
              AND r.pickup_date >= CURRENT_DATE - INTERVAL '90 days'
        ) rental_data
        GROUP BY brand
        HAVING SUM(daily_revenue) > (
            SELECT AVG(brand_revenue)
            FROM (
                SELECT SUM(r.price_per_day * (r.return_date - r.pickup_date)) AS brand_revenue
                FROM "public"."car" c
                JOIN "public"."Rental" r ON c.car_id = r.car_id
                WHERE r.rental_status = true
                GROUP BY c.brand
            ) avg_calc
        )
    ) brand_metrics
) ranked_brands
WHERE booking_rank <= 5
ORDER BY booking_rank ASC, brand_revenue DESC, brand ASC;