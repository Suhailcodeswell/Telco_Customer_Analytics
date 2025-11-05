-- 01_business_overview.sql
-- Business Performance Metrics
-- Insights: 26.5% churn rate, $456K monthly revenue

SELECT 
    COUNT(*) as total_customers,
    SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND((SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate_percent,
    ROUND(AVG(c6), 2) as avg_tenure_months,
    ROUND(AVG(c19), 2) as avg_monthly_revenue,
    ROUND(SUM(c19), 2) as total_monthly_revenue
FROM WA_FnUseC_TelcoCustomerChurn;