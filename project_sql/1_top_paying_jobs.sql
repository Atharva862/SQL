/* 
    Top paying jobs for Data Scientist 
    - Show top 10 highest paying Roles that are available remotely
    - Only display jobs where salary is not null
    - Why? To Highlight top-paying opportunities for Data Scientists
*/

SELECT 
    job_id,
    name AS company_name,
    job_title,
    job_via,
    job_location,
    salary_year_avg,
    job_posted_date::DATE
FROM
    job_postings_fact 
LEFT JOIN company_dim AS companies ON job_postings_fact.company_id = companies.company_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_location = 'Anywhere' AND  
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;