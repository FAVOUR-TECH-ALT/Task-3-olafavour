select*
from Raw_Dataset LIMIT ;

SELECT COUNT(*) AS total_orders,
       ROUND(SUM(TotalPrice),2) AS total_revenue,
       ROUND(AVG(TotalPrice),2) AS avg_order_value
FROM Raw_Dataset;

SELECT OrderID, Product, Quantity, TotalPrice
FROM Raw_Dataset
WHERE TotalPrice > 3000
ORDER BY TotalPrice DESC;

SELECT Product, COUNT(*) AS orders,
       ROUND(SUM(TotalPrice),2) AS revenue
FROM Raw_Dataset
GROUP BY Product
ORDER BY revenue DESC;


SELECT OrderStatus, COUNT(*) AS orders,
       ROUND(SUM(TotalPrice),2) AS revenue
FROM Raw_Dataset
GROUP BY OrderStatus
ORDER BY orders DESC;


SELECT YEAR([Date]) AS order_year,
       COUNT(*) AS orders,
       ROUND(SUM(TotalPrice),2) AS revenue
FROM Raw_Dataset
GROUP BY YEAR([Date])
ORDER BY order_year;


SELECT ReferralSource, ROUND(SUM(TotalPrice),2) AS revenue
FROM Raw_Dataset
GROUP BY ReferralSource
HAVING SUM(TotalPrice) > 250000
ORDER BY revenue DESC;

SELECT Product,
       ROUND(100.0*SUM(TotalPrice)/(SELECT SUM(TotalPrice) FROM Raw_Dataset),1) AS pct_of_sales
FROM Raw_Dataset
GROUP BY Product
ORDER BY pct_of_sales DESC;


SELECT PaymentMethod,
       ROUND(AVG(CAST(TotalPrice AS decimal(12,2))), 2) AS avg_order
FROM Raw_Dataset
GROUP BY PaymentMethod
ORDER BY avg_order DESC;
