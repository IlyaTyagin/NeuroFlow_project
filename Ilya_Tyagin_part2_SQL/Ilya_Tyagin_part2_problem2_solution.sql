/***********************************
**  Author: Ilya Tyagin
**  Create date: 05-06-2021
**  Description: NeuroFlow Part 2 (SQL) Problem 2 Solution
**  Problem: How many users completed a given amount of exercises?
**  Comment: This is a simple solution with COUNT function used.
**           It is also possible to use tiling/binning to construct a histogram-like results. 
************************************/

SELECT 
    COUNT(user_id) AS n_users,
    n_activities_per_user
FROM
    (
        SELECT
            user_id,
            COUNT(exercise_id) as n_activities_per_user
        FROM
            exercises
        GROUP BY
            user_id
    ) as per_user_table
GROUP BY
    n_activities_per_user
