CREATE TABLE Jan_2023_jobs AS
    SELECT  
        *
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        EXTRACT(MONTH FROM job_posted_date) = 01

SELECT * FROM Jan_2023_jobs
LIMIT 10;

CREATE TABLE Feb_2023_jobs AS
    SELECT  
        *
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        EXTRACT(MONTH FROM job_posted_date) = 02

SELECT * FROM Feb_2023_jobs
LIMIT 10;

CREATE TABLE Mar_2023_jobs AS
    SELECT  
        *
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(YEAR FROM job_posted_date) = 2023 AND
        EXTRACT(MONTH FROM job_posted_date) = 03

SELECT * FROM Mar_2023_jobs
LIMIT 10;