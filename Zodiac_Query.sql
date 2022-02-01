/* 
Finding zodiac signs of politicians using dataset "US Politicians Twitter Dataset" from user Andriy Samoshyn on Kaggle. Sex and Political party returned to find possible trends and correlations in Microsoft Power BI.
Data can be obtained at https://www.kaggle.com/mrmorj/us-politicians-twitter-dataset
*/
SELECT Name, Sex, Birthday, Political_party, 
	CASE
	WHEN (MONTH(Birthday) = 3 AND DAY(Birthday) >= 21) OR (MONTH(Birthday) = 4 AND DAY(Birthday) <= 19) Then 'Aries'
	WHEN (MONTH(Birthday) = 4 AND DAY(Birthday) >= 20) OR (MONTH(Birthday) = 5 AND DAY(Birthday) <= 20) Then 'Taurus'
	WHEN (MONTH(Birthday) = 5 AND DAY(Birthday) >= 21) OR (MONTH(Birthday) = 6 AND DAY(Birthday) <= 21) Then 'Gemini'
	WHEN (MONTH(Birthday) = 6 AND DAY(Birthday) >= 22) OR (MONTH(Birthday) = 7 AND DAY(Birthday) <= 22) Then 'Cancer'
	WHEN (MONTH(Birthday) = 7 AND DAY(Birthday) >= 23) OR (MONTH(Birthday) = 8 AND DAY(Birthday) <= 22) Then 'Leo'
	WHEN (MONTH(Birthday) = 8 AND DAY(Birthday) >= 23) OR (MONTH(Birthday) = 9 AND DAY(Birthday) <= 22) Then 'Virgo'
	WHEN (MONTH(Birthday) = 9 AND DAY(Birthday) >= 23) OR (MONTH(Birthday) = 10 AND DAY(Birthday) <= 23) Then 'Libra'
	WHEN (MONTH(Birthday) = 10 AND DAY(Birthday) >= 24) OR (MONTH(Birthday) = 11 AND DAY(Birthday) <= 21) Then 'Scorpio'
	WHEN (MONTH(Birthday) = 11 AND DAY(Birthday) >= 22) OR (MONTH(Birthday) = 12 AND DAY(Birthday) <= 21) Then 'Sagittarius'
	WHEN (MONTH(Birthday) = 12 AND DAY(Birthday) >= 22) OR (MONTH(Birthday) = 1 AND DAY(Birthday) <= 19) Then 'Capricorn'
	WHEN (MONTH(Birthday) = 1 AND DAY(Birthday) >= 20) OR (MONTH(Birthday) = 2 AND DAY(Birthday) <= 18) Then 'Aquarius'
	WHEN (MONTH(Birthday) = 2 AND DAY(Birthday) >= 19) OR (MONTH(Birthday) = 3 AND DAY(Birthday) <= 20) Then 'Pisces'
	ELSE 'ERROR'
	End AS 'ZSign'
FROM (
	SELECT 
	Name, 
	Birthplace, 
	Birthday, 
	Political_party,
	Sex,
	ROW_NUMBER() OVER(PARTITION BY Name ORDER BY Name DESC) rn
FROM Zodiac_Project..politician
) a
WHERE rn=1;

