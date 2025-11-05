# SQL Query Documentation

## Query Overview
All queries analyze the `WA_FnUseC_TelcoCustomerChurn` table with 7,044 customer records.

## Column Mapping
- c1 = customerID
- c6 = tenure (months)
- c9 = InternetService
- c16 = Contract
- c18 = PaymentMethod
- c19 = MonthlyCharges
- c21 = Churn (Yes/No)

## Query Details

### 01_business_overview.sql
**Purpose:** High-level business metrics
**Key Tables:** WA_FnUseC_TelcoCustomerChurn
**Complexity:** Basic aggregation

### 07_churn_risk_scoring.sql  
**Purpose:** Predictive risk modeling
**Algorithm:** 
- Month-to-month contract: +3 points
- Fiber optic service: +2 points
- Electronic check: +2 points
- Tenure < 12 months: +2 points
- Monthly charges > $80: +1 point
**Risk Categories:** CRITICAL (7+), HIGH (5-6), LOW (0-4)
