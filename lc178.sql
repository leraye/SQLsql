## LC 178
# MSSQL SERVER
SELECT
	Score,
	DENSE_RANK() OVER (ORDER BY Score DESC) AS Rank
FROM
	Scores
