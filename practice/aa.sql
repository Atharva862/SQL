SELECT 
    company.name,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year,
    EXTRACT(QUARTER FROM job_posted_date) AS quarter 
FROM 
    job_postings_fact
LEFT JOIN company_dim AS company ON job_postings_fact.company_id = company.company_id 
WHERE
    EXTRACT(YEAR FROM job_posted_date) = 2023 
    AND 
    EXTRACT(QUARTER FROM job_posted_date) = 2
GROUP BY 
    job_posted_date, company.name
LIMIT 10
;

SELECT * FROM job_postings_fact LIMIT 10;