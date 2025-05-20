--Find the count of the number of remote job postings per skills
-- Display the top 5 skills by their demand in remote jobs
-- Include skill ID, name, and count number of postings requiring the skill

SELECT * FROM job_postings_fact LIMIT 5; -- postings postType 

SELECT * FROM skills_dim LIMIT 5; -- skills id type

SELECT * FROM skills_job_dim LIMIT 5; -- only the ids


SELECT
    skill_name.skill_id,
    remote_postings.job_title_short,
    skill_name.skills,
    remote_postings.job_work_from_home,
    COUNT(*) AS postings
FROM (
SELECT 
    job_id,
    job_work_from_home,
    job_title_short
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home IS TRUE
) AS remote_postings
INNER JOIN skills_job_dim AS skillID ON remote_postings.job_id = skillID.job_id
INNER JOIN skills_dim AS skill_name ON skillID.skill_id = skill_name.skill_id
GROUP BY
    skill_name.skill_id,
    skill_name.skills,
    remote_postings.job_work_from_home,
    remote_postings.job_title_short
    ORDER BY
    postings DESC
LIMIT 5


WITH remote_postings AS (
    SELECT 
    job_id,
    job_work_from_home,
    job_title_short
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home IS TRUE
)
SELECT
    skill_name.skill_id,
    COUNT(*) AS postings,
    remote_postings.job_title_short,
    skill_name.skills,
    remote_postings.job_work_from_home
FROM 
    remote_postings
INNER JOIN skills_job_dim AS skillID ON remote_postings.job_id = skillID.job_id
INNER JOIN skills_dim AS skill_name ON skillID.skill_id = skill_name.skill_id
GROUP BY
    skill_name.skill_id,
    skill_name.skills,
    remote_postings.job_work_from_home,
    remote_postings.job_title_short
    ORDER BY
    postings DESC
LIMIT 5



-- CTE to count skills used in remote Data Analyst job postings
WITH remote_postings AS (
    SELECT 
        sjd.skill_id,
        COUNT(*) AS job_count
    FROM
        skills_job_dim sjd
    INNER JOIN job_postings_fact jpf 
        ON sjd.job_id = jpf.job_id
    WHERE 
        jpf.job_title_short = 'Data Analyst'
        AND jpf.job_work_from_home IS TRUE
    GROUP BY sjd.skill_id
)

-- Join with skills_dim to get skill names
SELECT
    sd.skill_id,
    sd.skills AS name,  -- more descriptive alias
    rp.job_count
FROM 
    remote_postings rp
JOIN skills_dim sd 
    ON rp.skill_id = sd.skill_id
ORDER BY
    rp.job_count DESC
LIMIT 5;
