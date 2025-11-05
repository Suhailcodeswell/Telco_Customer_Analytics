-- 04_payment_method_analysis.sql
-- Payment Method Churn Analysis
-- Critical Finding: Electronic check users have 45% churn rate

SELECT 
    c18 as PaymentMethod,
    COUNT(*) as total_customers,
    SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND((SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate_percent,
    ROUND(AVG(c19), 2) as avg_monthly_charges
FROM WA_FnUseC_TelcoCustomerChurn
GROUP BY c18
ORDER BY churn_rate_percent DESC;