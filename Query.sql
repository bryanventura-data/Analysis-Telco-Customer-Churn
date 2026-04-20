
# Verficamos los el largo de los valores de "Yes" y "No" de la columna Churn
SELECT DISTINCT Churn, LENGTH(Churn), HEX(Churn) FROM customers;

# Limpieza de caracteres invisibles
UPDATE customers SET
	Churn = REPLACE(REPLACE(Churn, '\r', ''), '\n', ''),
    gender = REPLACE(gender, '\r', ''),
    Partner = REPLACE(Partner, '\r', ''),
    Dependents = REPLACE(Dependents, '\r', ''),
    InternetService = REPLACE(InternetService, '\r', ''),
    Contract = REPLACE(Contract, '\r', ''),
    PaymentMethod = REPLACE(PaymentMethod, '\r', '');

# 1. Análisis general
 -- Obtenemos el total de clientes, cantidad de churn y tasa de abandono general
SELECT 
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS clientes_churn,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers;


# 2. Segmentación por contrato
-- Obtenemos el total de clientes, churn y tasa de churn por tipo de contrato
SELECT 
    Contract,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_clientes,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY Contract;


# 3. Segmentación por Internet
-- Obtenemos el total de clientes, churn y tasa de churn por tipo de servicio de internet
SELECT 
    InternetService,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_clientes,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM customers
GROUP BY InternetService;


# 4. Pagos mensuales vs churn
 -- Obtenemos el pago mensual promedio de los clientes que abandonaron el contrato y los que no
SELECT 
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS promedio_pago
FROM customers
GROUP BY Churn;


# 5. Tenure vs churn
  -- Obtenemos el promedio de antiguedad en meses de los clientes que abandonaron el contrato y los que no
SELECT 
    Churn,
    ROUND(AVG(tenure),2) AS promedio_antiguedad
FROM customers
GROUP BY Churn;

# 6. Tipo de contrato vs Tipo de servicio internet vs Pago mensual vs Antiguedad
 -- Mayor cantidad de churn en clientes con contratos mensuales, servicio de fibra ótica y promedio de antiguedad de 21.55 meses
SELECT 
    Contract,
    InternetService,
    COUNT(*) AS total_clientes,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_clientes,
    ROUND(AVG(MonthlyCharges),2) AS "Pago mensual promedio",
    ROUND(AVG(tenure),2) AS "Antiguedad promedio (meses)"
FROM customers
GROUP BY Contract, InternetService
ORDER BY churn_clientes DESC;
