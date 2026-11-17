/*
Question: What are the most optimal skills for data engineers—balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately instead of letting rare, outlier skills distort the results.
    - The natural log transformation ensures that both high-salary and widely in-demand skills surface as the most practical and valuable to learn for data engineering careers.
*/

SELECT
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)),1) ln_demand_count,
    ROUND(median_salary * ln_demand_count,1) optimal_score
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING demand_count >= 100
ORDER BY
    optimal_score DESC
LIMIT 25;

/*
┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │          193 │             5.3 │      975200.0 │
│ python     │      135000.0 │         1133 │             7.0 │      945000.0 │
│ aws        │      137320.0 │          783 │             6.7 │      920044.0 │
│ sql        │      130000.0 │         1128 │             7.0 │      910000.0 │
│ airflow    │      150000.0 │          386 │             6.0 │      900000.0 │
│ spark      │      140000.0 │          503 │             6.2 │      868000.0 │
│ snowflake  │      135500.0 │          438 │             6.1 │      826550.0 │
│ kafka      │      145000.0 │          292 │             5.7 │      826500.0 │
│ azure      │      128000.0 │          475 │             6.2 │      793600.0 │
│ java       │      135000.0 │          303 │             5.7 │      769500.0 │
│ scala      │      137290.0 │          247 │             5.5 │      755095.0 │
│ kubernetes │      150500.0 │          147 │             5.0 │      752500.0 │
│ databricks │      132750.0 │          266 │             5.6 │      743400.0 │
│ git        │      140000.0 │          208 │             5.3 │      742000.0 │
│ redshift   │      130000.0 │          274 │             5.6 │      728000.0 │
│ gcp        │      136000.0 │          196 │             5.3 │      720800.0 │
│ hadoop     │      135000.0 │          198 │             5.3 │      715500.0 │
│ nosql      │      134415.0 │          193 │             5.3 │      712399.5 │
│ pyspark    │      140000.0 │          152 │             5.0 │      700000.0 │
│ docker     │      135000.0 │          144 │             5.0 │      675000.0 │
│ mongodb    │      135750.0 │          136 │             4.9 │      665175.0 │
│ r          │      134775.0 │          133 │             4.9 │      660397.5 │
│ go         │      140000.0 │          113 │             4.7 │      658000.0 │
│ github     │      135000.0 │          127 │             4.8 │      648000.0 │
│ bigquery   │      135000.0 │          123 │             4.8 │      648000.0 │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘ */