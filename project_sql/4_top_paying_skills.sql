/*
    What are the top skills based on salary?
    - Look at the average salary associated with each skill for Data Scientists positions
    - Focuses on roles with specified salaries, regardless of location
    - Why? It reveals how different skills impact salary levels for Data Scientists and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    job_title,
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim AS skill ON job_postings_fact.job_id = skill.job_id
INNER JOIN skills_dim AS skills_d ON skill.skill_id = skills_d.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
GROUP BY 
    job_title,
    skills
ORDER BY
    avg_salary DESC
LIMIT 10;