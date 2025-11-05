-- 03_service_analysis.sql
-- Internet Service Churn Analysis
-- Critical Finding: Fiber optic customers have 41.9% churn despite $91/month revenue

SELECT 
    c9 as InternetService,
    COUNT(*) as total_customers,
    SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND((SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate_percent,
    ROUND(AVG(c19), 2) as avg_monthly_charges
FROM WA_FnUseC_TelcoCustomerChurn
GROUP BY c9
ORDER BY churn_rate_percent DESC;