# Introduction
📊 This project analyzes job postings to identify the most in-demand skills and their associated salaries for remote Data Scientist roles. By combining skill frequency with average salary data, the goal is to highlight which technical skills are both popular and well-compensated in the current remote job market.
    🔍 Check out the SQL queries used in this analysis here : [project_sql folder](/project_sql/)
#   Background
With the rapid growth of remote work, Data Science roles have become increasingly accessible from anywhere in the world. This project explores a dataset of job postings to identify the most in-demand skills and the average salaries offered for remote Data Scientist positions. The goal is to provide insights for job seekers and help them understand which technical skills are both valuable and well-paid in the remote job market.
#   Tools I Used
🐘 PostgreSQL
    PostgreSQL served as the core database engine for executing SQL queries and performing complex data analysis. Its robust support for window functions, joins, and CTEs (Common Table Expressions) made it ideal for exploring relationships between job postings, companies, and technical skills.

💻 Visual Studio Code (VS Code)
    VS Code was the primary development environment used to write, organize, and manage SQL scripts and documentation. With extensions like SQL syntax highlighting and Git integration, it helped streamline the workflow and keep code clean and readable.

🔧 Git
    Git was used for version control, allowing me to track changes to SQL scripts and documentation over time. This made it easy to experiment, revert mistakes, and maintain a clean history of development.

🌐 GitHub
    GitHub was used to host the project, collaborate, and share the analysis publicly. It also acts as a central place for documentation and source code, making the project easy to access and present as part of a data portfolio.
#   The Analysis
### 1. Top Paying Jobs
To identify the top paying remote jobs i filtered out the Data Scientist roles, Location to remote i.e. Anywhere and made sure that the salary is mentioned and not null. Highlighting the high paying opportunies available for Data Scientists. 
```sql
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
 ```
 ### 2. Top Paying Job Skills
#   What I Learned
#   Conclusion