-- 1. Revenue per sales channel for a given year
SELECT sales_channel,
       SUM(amount) AS total_revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel;
-- 2. Top 10 customers by total spending
SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;
-- 3. Monthly revenue, expense, profit and status
WITH revenue AS (
    SELECT strftime('%m', datetime) AS month,
           SUM(amount) AS revenue
    FROM clinic_sales
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
),
expenses_cte AS (
    SELECT strftime('%m', datetime) AS month,
           SUM(amount) AS expense
    FROM expenses
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
)
SELECT r.month,
       r.revenue,
       e.expense,
       (r.revenue - e.expense) AS profit,
       CASE 
           WHEN (r.revenue - e.expense) > 0 THEN 'Profitable'
           ELSE 'Not Profitable'
       END AS status
FROM revenue r
LEFT JOIN expenses_cte e ON r.month = e.month;
-- 4. Most profitable clinic per city for a given month
WITH profit_cte AS (
    SELECT c.city,
           cs.cid,
           SUM(cs.amount) - COALESCE(SUM(e.amount),0) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE strftime('%m', cs.datetime) = '01'
    GROUP BY c.city, cs.cid
),
ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY city ORDER BY profit DESC) AS rnk
    FROM profit_cte
)
SELECT * 
FROM ranked
WHERE rnk = 1;
-- 5. Second least profitable clinic per state for a given month
WITH profit_cte AS (
    SELECT c.state,
           cs.cid,
           SUM(cs.amount) - COALESCE(SUM(e.amount),0) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE strftime('%m', cs.datetime) = '01'
    GROUP BY c.state, cs.cid
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY state ORDER BY profit ASC) AS rnk
    FROM profit_cte
)
SELECT *
FROM ranked
WHERE rnk = 2;