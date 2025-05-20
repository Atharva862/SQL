SELECT 
    jobs.job_title_short,
    jobs.job_location,
    jobs.job_posted_date::DATE,
    jobs.salary_year_avg
FROM (
    SELECT * FROM jan_2023_jobs
    UNION ALL
    SELECT * FROM feb_2023_jobs
    UNION ALL
    SELECT * FROM mar_2023_jobs
) AS jobs
WHERE
    jobs.salary_year_avg > 70000 AND 
    jobs.job_title_short = 'Data Analyst'
ORDER BY
    jobs.salary_year_avg DESC;



SELECT 
    sjd.job_id,
    sd.skills,
    sd.type,
    job_location,
    salary_year_avg,
    job_title_short,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN skills_job_dim AS sjd ON job_postings_fact.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE 
    salary_year_avg > 70000 AND 
    salary_year_avg IS NOT NULL AND
    EXTRACT(MONTH FROM job_posted_date) BETWEEN 1 AND 3 AND
    job_title_short = 'Data Analyst' 
ORDER BY
    salary_year_avg DESC