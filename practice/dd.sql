SELECT *
FROM 
    skills_dim --has skill id skills and type
LIMIT 5

SELECT *
FROM
    skills_job_dim  --only has skill id and job id
LIMIT 5

SELECT *
FROM 
    job_postings_fact -- has the job posting
LIMIT 5 

SELECT 
    sd.skills,
    top_skills.skill_count
FROM 
    (    
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY 
        skill_count DESC
    LIMIT 5
     ) AS top_skills
LEFT JOIN skills_dim AS sd ON top_skills.skill_id = sd.skill_id
ORDER BY 
    top_skills.skill_count DESC;



SELECT *
FROM
    company_dim
LIMIT 5


SELECT
    company.company_id,
    company_job_count.job_count,
    CASE
        WHEN job_count < 10 THEN 'Small Company'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium Size Company'
        WHEN job_count > 50 THEN 'Large Company'
    END AS size
FROM (
SELECT
    company_id,
    COUNT(*) AS job_count
FROM 
    job_postings_fact
GROUP BY    
    company_id
) AS company_job_count
LEFT JOIN company_dim AS company ON company_job_count.company_id = company.company_id
ORDER BY
    job_count DESC