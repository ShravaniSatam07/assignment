--What is the median amount paid each year for all payment methods?

WITH PaymentData AS (
    SELECT
        YEAR(CAST(payment_date AS DATE)) AS payment_year,
        payment_method,
        amount_paid,
        ROW_NUMBER() OVER (PARTITION BY YEAR(CAST(payment_date AS DATE)), payment_method ORDER BY amount_paid) AS row_num,
        COUNT(*) OVER (PARTITION BY YEAR(CAST(payment_date AS DATE)), payment_method) AS total_count
    FROM
        payment_information
),
MedianCalculations AS (
    SELECT
        payment_year,
        payment_method,
        amount_paid
    FROM
        PaymentData
    WHERE
        row_num IN (
            (total_count + 1) / 2,
            (total_count + 2) / 2
        )
)
SELECT
    payment_year,
    payment_method,
    AVG(amount_paid) AS median_amount_paid
FROM
    MedianCalculations
GROUP BY
    payment_year,
    payment_method
ORDER BY
    payment_year,
    payment_method