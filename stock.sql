#Total Records Check
SELECT COUNT(*) AS total_rows
FROM stocks;

# Company-wise Average Closing Price
SELECT
    ticker,
    ROUND(AVG(close), 2) AS avg_closing_price
FROM stocks
GROUP BY ticker;

# Highest & Lowest Closing Price per Company
SELECT
    ticker,
    MAX(close) AS highest_close,
    MIN(close) AS lowest_close
FROM stocks
GROUP BY ticker;

#Total Trading Volume per Company
SELECT
    ticker,
    SUM(volume) AS total_volume
FROM stocks
GROUP BY ticker;

#Daily Price Volatility (High − Low)
SELECT
    ticker,
    date,
    (high - low) AS daily_volatility
FROM stocks
ORDER BY date;

#Average Volatility per Company
SELECT
    ticker,
    ROUND(AVG(high - low), 2) AS avg_volatility
FROM stocks
GROUP BY ticker;

#Day-wise Price Change (Close − Open)

SELECT
    ticker,
    date,
    (close - open) AS price_change
FROM stocks
ORDER BY date;

#Monthly Average Closing Price

SELECT
    ticker,
    YEAR(date) AS year,
    MONTH(date) AS month,
    ROUND(AVG(close), 2) AS avg_monthly_close
FROM stocks
GROUP BY ticker, year, month
ORDER BY year, month;

#Best Performing Day (Simple)
SELECT
    ticker,
    date,
    (close - open) AS price_gain
FROM stocks
ORDER BY price_gain DESC
LIMIT 1;

# Worst Performing Day (Simple)
SELECT
    ticker,
    date,
    (close - open) AS price_loss
FROM stocks
ORDER BY price_loss ASC
LIMIT 1;

#Dataset for Power BI Dashboard
SELECT
    ticker,
    date,
    open,
    high,
    low,
    close,
    volume
FROM stocks;


