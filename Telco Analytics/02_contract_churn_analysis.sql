-- 02_contract_churn_analysis.sql
-- Churn Analysis by Contract Type
-- Critical Finding: Month-to-month contracts have 42.7% churn vs 2.8% for 2-year

SELECT 
    c16 as Contract,
    COUNT(*) as total_customers,
    SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) as churned_customers,
    ROUND((SUM(CASE WHEN c21 = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) as churn_rate_percent,
    ROUND(AVG(c19), 2) as avg_monthly_charges
FROM WA_FnUseC_TelcoCustomerChurn
GROUP BY c16
ORDER BY churn_rate_percent DESC;