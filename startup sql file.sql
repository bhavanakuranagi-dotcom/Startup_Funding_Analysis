CREATE DATABASE StartupFundingDB;

USE StartupFundingDB;
CREATE TABLE startup_funding_cleaned (
    SrNo INT,
    Date DATE,
    StartupName VARCHAR(255),
    IndustryVertical VARCHAR(255),
    SubVertical VARCHAR(255),
    CityLocation VARCHAR(150),
    InvestorsName TEXT,
    InvestmentType VARCHAR(150),
    AmountInUSD BIGINT,
    Remarks TEXT
);
SELECT * FROM startup_funding_cleaned;

SELECT COUNT(*) AS Total_Records
FROM startup_funding_cleaned;

DESCRIBE startup_funding_cleaned;

SELECT *
FROM startup_funding_cleaned
WHERE StartupName IS NULL
   OR IndustryVertical IS NULL
   OR CityLocation IS NULL
   OR InvestorsName IS NULL
   OR InvestmentType IS NULL
   OR AmountInUSD IS NULL;
   
   SELECT COUNT(DISTINCT StartupName) AS Total_Startups
FROM startup_funding_cleaned;

SELECT SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned;

SELECT ROUND(AVG(AmountInUSD),2) AS Average_Funding
FROM startup_funding_cleaned;

SELECT StartupName, AmountInUSD
FROM startup_funding_cleaned
ORDER BY AmountInUSD DESC
LIMIT 1;

SELECT StartupName, AmountInUSD
FROM startup_funding_cleaned
WHERE AmountInUSD IS NOT NULL
ORDER BY AmountInUSD
LIMIT 1;

SELECT StartupName,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY StartupName
ORDER BY Total_Funding DESC
LIMIT 10;

SELECT CityLocation,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY CityLocation
ORDER BY Total_Funding DESC
LIMIT 10;

SELECT CityLocation,
COUNT(DISTINCT StartupName) AS Startup_Count
FROM startup_funding_cleaned
GROUP BY CityLocation
ORDER BY Startup_Count DESC;

SELECT IndustryVertical,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY IndustryVertical
ORDER BY Total_Funding DESC;

SELECT IndustryVertical,
COUNT(*) AS Startup_Count
FROM startup_funding_cleaned
GROUP BY IndustryVertical
ORDER BY Startup_Count DESC;

SELECT InvestmentType,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY InvestmentType
ORDER BY Total_Funding DESC;

SELECT InvestorsName,
COUNT(*) AS Total_Investments
FROM startup_funding_cleaned
GROUP BY InvestorsName
ORDER BY Total_Investments DESC
LIMIT 10;

SELECT YEAR(Date) AS Funding_Year,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY YEAR(Date)
ORDER BY Funding_Year;

SELECT YEAR(Date) AS Year,
MONTHNAME(Date) AS Month,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY YEAR(Date), MONTH(Date), MONTHNAME(Date)
ORDER BY Year, MONTH(Date);

SELECT IndustryVertical,
ROUND(AVG(AmountInUSD),2) AS Average_Funding
FROM startup_funding_cleaned
GROUP BY IndustryVertical
ORDER BY Average_Funding DESC;

SELECT InvestmentType,
COUNT(*) AS Investment_Count
FROM startup_funding_cleaned
GROUP BY InvestmentType
ORDER BY Investment_Count DESC;

SELECT CityLocation,
ROUND(AVG(AmountInUSD),2) AS Average_Funding
FROM startup_funding_cleaned
GROUP BY CityLocation
ORDER BY Average_Funding DESC
LIMIT 5;

SELECT StartupName,
AmountInUSD
FROM startup_funding_cleaned
WHERE AmountInUSD >
(
SELECT AVG(AmountInUSD)
FROM startup_funding_cleaned
)
ORDER BY AmountInUSD DESC;

SELECT CityLocation,
SUM(AmountInUSD) AS Total_Funding
FROM startup_funding_cleaned
GROUP BY CityLocation
HAVING SUM(AmountInUSD) > 1000000000;

SELECT CityLocation,
MAX(AmountInUSD) AS Highest_Funding
FROM startup_funding_cleaned
GROUP BY CityLocation;

SELECT StartupName,
SUM(AmountInUSD) AS Total_Funding,
RANK() OVER(ORDER BY SUM(AmountInUSD) DESC) AS Funding_Rank
FROM startup_funding_cleaned
GROUP BY StartupName;

SELECT YEAR(Date) AS Year,
COUNT(*) AS Investments
FROM startup_funding_cleaned
GROUP BY YEAR(Date)
ORDER BY Year;

SELECT
COUNT(DISTINCT StartupName) AS Total_Startups,
COUNT(DISTINCT CityLocation) AS Total_Cities,
COUNT(DISTINCT InvestorsName) AS Total_Investors,
COUNT(DISTINCT IndustryVertical) AS Total_Industries,
SUM(AmountInUSD) AS Total_Funding,
ROUND(AVG(AmountInUSD),2) AS Average_Funding
FROM startup_funding_cleaned;

