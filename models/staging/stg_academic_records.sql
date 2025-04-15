{{ config(materialized='table') }}

WITH source AS (
    SELECT  
        caseid,
        total_score,
        number_of_subjects,
        subjects,
        subjects_selected
    FROM {{ source('raw_data', 'student_records') }}
)

SELECT
    caseid AS student_id,
    CAST(NULLIF(total_score, '---') AS INTEGER) AS total_score,
    CAST(NULLIF(number_of_subjects, '---') AS INTEGER) AS number_of_subjects,
    subjects,
    CAST(NULLIF(subjects_selected, '---') AS INTEGER) AS subjects_selected,
    CURRENT_TIMESTAMP as loaded_at
FROM source
