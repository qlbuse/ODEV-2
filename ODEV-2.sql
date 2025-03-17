
1-Invoice tablosunda tüm değerleri NULL olan kayıtların sayısını bulmamız isteniyor. Bunun için de tüm kolonları
tek tek AND ve IS NULL kullanarak sorguluyoruz.

SELECT COUNT (*)
FROM invoice
WHERE invoice_id IS NULL
AND customer_id IS NULL
AND invoice_date IS NULL
AND billing_address IS NULL 
AND billing_city IS NULL 
AND billing_state IS NULL 
AND billing_country IS NULL
AND billingpostal_code IS NULL;

--TOTAL ROWS: 1

2-Total değerlerini 2 ile çarparak yeni bir total kolonu oluşturup yeni bir isim veriyoruz. Yeni halini sıralamak
için de DESC operatörünü ekliyoruz.

SELECT total,
       total * 2 AS new_total
FROM invoice
ORDER BY total DESC;

3-Adres kolonundaki verilerden istenilen karakterleri bu şekilde alabiliriz. Tarih filtresi için de EXTRACT 
kullanıyoruz.

SELECT CONCAT(LEFT(billing_address,3),RIGHT(billing_address,4))
FROM invoice
WHERE 
    EXTRACT(YEAR FROM invoice_date) = 2013
	AND EXTRACT(MONTH FROM invoice_date) = 8;