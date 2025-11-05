-- 06_customer_lifetime_value.sql
-- Customer Lifetime Value Analysis
-- Critical Finding: $1.2M annual revenue lost from month-to-month fiber churn

SELECT 
    c16 as Contract,
    c9 as InternetService,
    COUNT(*) as total_customers,
    ROUND(AVG(c19), 2) as avg_monthly_charge,
    ROUND(AVG(c19 * 12), 2) as avg_annual_value,
    ROUND(SUM(CASE WHEN c21 = 'Yes' THEN c19 * 12 ELSE 0 END), 2) as annual_revenue_lost
FROM WA_FnUseC_TelcoCustomerChurn
GROUP BY c16, c9
ORDER BY avg_annual_value DESC;