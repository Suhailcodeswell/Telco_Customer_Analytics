-- 08_retention_opportunities.sql
-- Data-Driven Retention Strategy Recommendations
-- Specific customers and actions to reduce churn

SELECT 
    c1 as customerID,
    c6 as tenure,
    c19 as MonthlyCharges,
    c16 as Contract,
    c9 as InternetService,
    c18 as PaymentMethod,
    
    -- Retention priority score
    (CASE WHEN c19 > 90 THEN 3 ELSE 0 END) +
    (CASE WHEN c9 = 'Fiber optic' THEN 2 ELSE 0 END) +
    (CASE WHEN c6 BETWEEN 3 AND 12 THEN 2 ELSE 0 END) as retention_priority,
    
    CASE 
        WHEN c16 = 'Month-to-month' AND c19 > 80 THEN 'Offer annual contract discount'
        WHEN c18 = 'Electronic check' THEN 'Promote automatic payments'
        WHEN c6 < 3 AND c19 > 70 THEN 'Early onboarding intervention'
        ELSE 'Standard retention program'
    END as recommended_action
    
FROM WA_FnUseC_TelcoCustomerChurn
WHERE c21 = 'No'  -- Current customers only
ORDER BY retention_priority DESC
LIMIT 15;