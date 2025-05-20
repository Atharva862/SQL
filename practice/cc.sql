SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'REMOTE'
        WHEN job_location = 'New York, NY' THEN 'local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

SELECT 
    COUNT(job_id) AS number_of_jobs,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 200000 THEN 'High'
        WHEN salary_year_avg >= 100000 THEN 'Normal'
        WHEN salary_year_avg IS NULL THEN 'Not Given'
        ELSE 'Low'
    END AS salary_range
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    job_title_short,
    salary_range,
    salary_year_avg
ORDER BY
    salary_year_avg DESC;