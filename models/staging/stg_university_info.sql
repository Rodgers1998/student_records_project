WITH source AS (
    SELECT  
        caseid,
        university,
        course
    FROM {{ source('raw_data', 'student_records') }}
)

SELECT
    caseid AS student_id,
    NULLIF(university, '---') AS university,
    NULLIF(course, '---') AS course,
    CURRENT_TIMESTAMP as loaded_at
FROM source
