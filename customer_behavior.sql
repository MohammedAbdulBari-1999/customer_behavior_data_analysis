-- =========================================
-- CUSTOMER BEHAVIOR ANALYSIS (SQL)
-- =========================================


-- Q1. Revenue contribution by gender
-- Purpose: Understand which gender generates more revenue

SELECT 
    gender,
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;



-- Q2. High-value customers using discounts
-- Purpose: Identify customers who used discounts but still spent above average

WITH avg_spend AS (
    SELECT AVG(purchase_amount) AS avg_purchase FROM customer
)

SELECT 
    c.customer_id,
    c.purchase_amount
FROM customer c
JOIN avg_spend a ON c.purchase_amount > a.avg_purchase
WHERE c.discount_applied = 'Yes'
ORDER BY c.purchase_amount DESC;



-- Q3. Top 5 products by average rating
-- Purpose: Identify highest-rated products

SELECT 
    item_purchased,
    ROUND(AVG(review_rating),2) AS avg_rating
FROM customer
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;



-- Q4. Average purchase by shipping type
-- Purpose: Compare customer spending based on delivery method

SELECT 
    shipping_type,
    ROUND(AVG(purchase_amount),2) AS avg_purchase
FROM customer
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type;



-- Q5. Subscriber vs Non-Subscriber Analysis
-- Purpose: Compare revenue and spending behavior

SELECT 
    subscription_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount),2) AS avg_spend,
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;



-- Q6. Products with highest discount usage %
-- Purpose: Identify products most dependent on discounts

SELECT 
    item_purchased,
    ROUND(
        100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*), 2
    ) AS discount_percentage
FROM customer
GROUP BY item_purchased
ORDER BY discount_percentage DESC
LIMIT 5;



-- Q7. Customer Segmentation (New / Returning / Loyal)
-- Purpose: Segment customers based on purchase history

WITH customer_segments AS (
    SELECT 
        customer_id,
        previous_purchases,
        CASE 
            WHEN previous_purchases = 1 THEN 'New'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS segment
    FROM customer
)

SELECT 
    segment,
    COUNT(*) AS total_customers
FROM customer_segments
GROUP BY segment
ORDER BY total_customers DESC;



-- Q8. Top 3 products per category (using ranking)
-- Purpose: Find best-selling products within each category

WITH ranked_products AS (
    SELECT 
        category,
        item_purchased,
        COUNT(*) AS total_orders,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM customer
    GROUP BY category, item_purchased
)

SELECT 
    category,
    item_purchased,
    total_orders
FROM ranked_products
WHERE rank <= 3;



-- Q9. Repeat buyers vs subscription behavior
-- Purpose: Check if repeat buyers are more likely to subscribe

SELECT 
    subscription_status,
    COUNT(*) AS repeat_customers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;



-- Q10. Revenue contribution by age group
-- Purpose: Identify high-value age segments

SELECT 
    age_group,
    ROUND(SUM(purchase_amount),2) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;