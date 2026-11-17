SELECT 
    job_id,
    job_title_short,
    JPF.company_id,
    name AS company_name,
    job_location
FROM 
    job_postings_fact AS JPF 
LEFT JOIN company_dim AS CD 
    ON JPF.company_id = CD.company_id
LIMIT 10;



SELECT 
    JPF.job_id,
    JPF.job_title_short,
    SJD.skill_id,
    sd.skills
FROM 
    job_postings_fact AS JPF 
LEFT JOIN skills_job_dim AS SJD
    ON JPF.job_id = SJD.job_id
LEFT JOIN skills_dim AS SD
    ON SJD.skill_id = SD.skill_id
LIMIT 10;




SELECT 
    JPF.job_id,
    JPF.job_title_short,
    SJD.skill_id,
    sd.skills
FROM 
    job_postings_fact AS JPF 
INNER JOIN skills_job_dim AS SJD
    ON JPF.job_id = SJD.job_id
INNER JOIN skills_dim AS SD
    ON SJD.skill_id = SD.skill_id;