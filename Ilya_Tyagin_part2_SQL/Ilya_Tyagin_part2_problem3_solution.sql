/***********************************
**  Author: Ilya Tyagin
**  Create date: 05-06-2021
**  Description: NeuroFlow Part 2 (SQL) Problem 3 Solution
**  Problem: Which organizations have the most severe patient population?
************************************/

SELECT 
    organization_id,
    organization_name,
    AVG(score) as avg_phq9_score
FROM
    Providers, Phq9
WHERE
    Providers.provider_id = Phq9.provider_id
GROUP BY
    organization_id
ORDER BY
    avg_phq9_score DESC
LIMIT 5;
