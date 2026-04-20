# Análisis de churn de clientes de una empresa de telecomunicaciones

Este proyecto analiza la deserción de clientes (churn) de una empresa de telecomunicaciones para identificar patrones y factores clave que inluyen en el abandono de servicios.

## 📊 Dashboard Interactivo
Para explorar el dashboard interactivo en tiempo real haga clic en la imagen de abajo :

[![Ver Dashboard en Power BI](Dashboard.png)](https://app.powerbi.com/view?r=eyJrIjoiYTE4OGQ2MjAtOGUxMS00MWQ1LTg0MTUtNWI5NzgzZjg0NjNiIiwidCI6ImY5MzRlNWY3LTAwODgtNGJlZS1hN2RlLWI5ZWNjNWY2OTQxZCIsImMiOjR9)

---

## Herramientas Utilizadas
* **Python (Pandas/Plotly express):** Limpieza de datos y análisis exploratorio (EDA).
* **SQL (MySQL):Modelado relacional y validación de hallazgos mediante consultas.
* **Power BI:** Visualización de datos y creación del dashboard interactivo.

## 📈 Hallazgos Principales
* El 26.58% de los clientes abandonó el servicio (1,869 clientes).
* Los contratos mensuales concentran el 88.5% del churn total.
* El promedio de pago mensual de clientes que abandonan el contrato es 74.44, frente a 61.31 de los que permanecen.
* Los clientes que abandonan tienen en promedio 18 meses de antigüedad vs 37 de los que permanecen.
* El servicio de fibra óptica tiene una tasa de abandono del 41.89%, esto representa el 69.4% del churn total.
* El perfil de mayor riesgo es un cliente nuevo con contrato mensual, fibra óptica y pagos entre 80 y 100.
