-- 05_high_value_customer_analysis.sql
-- High-Value Customer Churn Analysis
-- Critical Finding: $99/month customers leaving within first year

SELECT 
    c1 as customerID,
    c6 as tenure,
    c19 as MonthlyCharges,
    c16 as Contract,
    c9 as InternetService,
    c21 as Churn
FROM WA_FnUseC_TelcoCustomerChurn
WHERE c19 > 80 AND c21 = 'Yes'
ORDER BY c19 DESC
LIMIT 15;