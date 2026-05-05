-- Q1: Count transactions by status
SELECT 
    status,
    COUNT(*) AS transaction_count
FROM cleaned_transactions
GROUP BY status
ORDER BY transaction_count DESC;

-- Q2: Calculate total captured GMV by merchant
SELECT 
    merchant_name,
    SUM(amount_usd) AS total_gmv
FROM cleaned_transactions
WHERE status = 'captured'
GROUP BY merchant_name
ORDER BY total_gmv DESC;

-- Q3: Top 10 merchants by captured GMV
SELECT 
    merchant_name,
    SUM(amount_usd) AS total_captured_gmv
FROM cleaned_transactions
WHERE status = 'captured'
GROUP BY merchant_name
ORDER BY total_captured_gmv DESC
LIMIT 10;

-- Q4: Daily GMV and successful transaction count
SELECT 
    transaction_date,
    SUM(amount_usd) AS daily_gmv,
    COUNT(*) AS successful_transactions
FROM cleaned_transactions
WHERE status = 'captured'
GROUP BY transaction_date
ORDER BY transaction_date;

-- Q5: Merchants with chargeback ratio above 1%
SELECT 
    merchant_name,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN status = 'chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
    ROUND(SUM(CASE WHEN status = 'chargeback' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS chargeback_ratio
FROM cleaned_transactions
GROUP BY merchant_name
HAVING chargeback_ratio > 1
ORDER BY chargeback_ratio DESC;

-- Q6: Regions with average risk score above 50 and more than 20 transactions
SELECT 
    gateway_region,
    COUNT(*) AS total_transactions,
    ROUND(AVG(risk_score), 2) AS avg_risk_score
FROM cleaned_transactions
GROUP BY gateway_region
HAVING avg_risk_score > 50 AND total_transactions > 20
ORDER BY avg_risk_score DESC;

-- Q7: Users with 3 or more failed or chargeback transactions on the same day
SELECT 
    user_id,
    transaction_date,
    COUNT(*) AS failed_or_chargeback_count
FROM cleaned_transactions
WHERE status IN ('failed', 'chargeback')
GROUP BY user_id, transaction_date
HAVING failed_or_chargeback_count >= 3
ORDER BY failed_or_chargeback_count DESC;

-- Q8: Chargeback count, unique affected users, and chargeback amount by merchant
SELECT 
    merchant_name,
    COUNT(*) AS chargeback_count,
    COUNT(DISTINCT user_id) AS unique_affected_users,
    SUM(amount_usd) AS chargeback_amount
FROM cleaned_transactions
WHERE status = 'chargeback'
GROUP BY merchant_name
ORDER BY chargeback_count DESC;
