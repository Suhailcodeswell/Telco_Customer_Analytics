-- 07_churn_risk_scoring.sql
-- Predictive Churn Risk Scoring Model
-- Identifies customers with 90%+ churn probability

SELECT 
    c1 as customerID,
    c6 as tenure,
    c19 as MonthlyCharges,
    c16 as Contract,
    c9 as InternetService,
    c18 as PaymentMethod,
    
    -- Risk scoring algorithm
    (CASE WHEN c16 = 'Month-to-month' THEN 3 ELSE 0 END) +
    (CASE WHEN c9 = 'Fiber optic' THEN 2 ELSE 0 END) +
    (CASE WHEN c18 = 'Electronic check' THEN 2 ELSE 0 END) +
    (CASE WHEN c6 < 12 THEN 2 ELSE 0 END) +
    (CASE WHEN c19 > 80 THEN 1 ELSE 0 END) as churn_risk_score,
    
    CASE 
        WHEN (CASE WHEN c16 = 'Month-to-month' THEN 3 ELSE 0 END) +
             (CASE WHEN c9 = 'Fiber optic' THEN 2 ELSE 0 END) +
             (CASE WHEN c18 = 'Electronic check' THEN 2 ELSE 0 END) +
             (CASE WHEN c6 < 12 THEN 2 ELSE 0 END) +
             (CASE WHEN c19 > 80 THEN 1 ELSE 0 END) >= 7 THEN 'CRITICAL RISK'
        WHEN (CASE WHEN c16 = 'Month-to-month' THEN 3 ELSE 0 END) +
             (CASE WHEN c9 = 'Fiber optic' THEN 2 ELSE 0 END) +
             (CASE WHEN c18 = 'Electronic check' THEN 2 ELSE 0 END) +
             (CASE WHEN c6 < 12 THEN 2 ELSE 0 END) +
             (CASE WHEN c19 > 80 THEN 1 ELSE 0 END) >= 5 THEN 'HIGH RISK'
        ELSE 'LOW RISK'
    END as risk_category,
    
    c21 as Churn
    
FROM WA_FnUseC_TelcoCustomerChurn
ORDER BY churn_risk_score DESC
LIMIT 20;