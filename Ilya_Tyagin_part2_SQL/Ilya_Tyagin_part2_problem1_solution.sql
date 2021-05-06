/***********************************
**  Author: Ilya Tyagin
**  Create date: 05-06-2021
**  Description: NeuroFlow Part 2 (SQL) Problem 1 Solution
**  Problem: How many users completed an exercise in their first month per monthly cohort?
************************************/

SELECT
    signup_date AS cohort_date,
    100.0*SUM(user_1st_month_completion_flag)/COUNT(user_1st_month_completion_flag) AS result_percent
FROM
    (
        SELECT 
            users.user_id,
            strftime('%Y-%m', created_at) AS signup_date,
            first_completion_date,
            CASE 
                WHEN strftime('%Y-%m', created_at) = first_completion_date
                THEN 1
                ELSE 0
            END AS user_1st_month_completion_flag
        FROM
            users,
            (
                SELECT
                    user_id,
                    MIN(strftime('%Y-%m', exercise_completion_date)) AS first_completion_date
                FROM
                    exercises
                GROUP BY
                    user_id
            ) AS first_completion_table
        WHERE 
            users.user_id = first_completion_table.user_id
        ) as t1
GROUP BY
    cohort_date
