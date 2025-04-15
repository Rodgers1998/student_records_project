{{ config(materialized='table') }}

WITH source AS (
    SELECT  
        caseid,
        name_of_the_subject,
        what_did_you_score
    FROM {{ source('raw_data', 'student_records') }}
)

SELECT
    caseid AS student_id,
    NULLIF(name_of_the_subject, '---') AS subject_name,
    CAST(NULLIF(what_did_you_score, '---') AS INTEGER) AS score,
    CURRENT_TIMESTAMP as loaded_at
FROM source
WHERE name_of_the_subject IS NOT NULL AND name_of_the_subject != '---'
