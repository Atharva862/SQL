/* 
    In-Demand Skills for Data Scientist 
    - Show top 10 in demand skills that are available 
    - Only display jobs where salary is not null
    - Why? To Highlight top-demanding skills for Data Scientists
*/



WITH job_postings AS (
    SELECT 
    job_id,
    job_work_from_home,
    job_title_short
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Scientist' 
)
SELECT
    skill_name.skill_id,
     skill_name.skills,
    COUNT(*) AS skill_count
FROM 
    job_postings
INNER JOIN skills_job_dim AS skillID ON job_postings.job_id = skillID.job_id
INNER JOIN skills_dim AS skill_name ON skillID.skill_id = skill_name.skill_id
GROUP BY
    skill_name.skill_id,
    skill_name.skills
    ORDER BY
    skill_count DESC
LIMIT 10;