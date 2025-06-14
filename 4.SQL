WITH Ordered AS (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowAsc,
           COUNT(*) OVER () AS TotalCount
    FROM STATION
)
SELECT
    ROUND(AVG(LAT_N), 4) AS Median_LAT_N
FROM Ordered
WHERE RowAsc IN ((TotalCount + 1) / 2, (TotalCount + 2) / 2);
