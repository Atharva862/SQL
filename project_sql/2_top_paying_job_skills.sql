/* 
    Top paying jobs, skills for Data Scientist 
    - Show top 10 highest paying jobs and what skills they require are available remotely
    - Only display jobs where salary is not null
    - Why? To Highlight top-paying jobs and the skills required for them
*/

WITH top_paying_jobs AS(
    SELECT 
        job_id,
        name AS company_name,
        job_title,
        job_via,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim AS companies ON job_postings_fact.company_id = companies.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere' AND  
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim AS skills ON skills_job_dim.skill_id = skills.skill_id
ORDER BY 
    salary_year_avg DESC;