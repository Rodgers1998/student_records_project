{{ config(materialized='table') }}

WITH source AS (
    SELECT  
        caseid,
        student_name,
        gender,
        county,
        level_of_study,
        name_of_school,
        owner_name,
        admission_number,
        favorite_meal,
        ward,
        sub_county
    FROM {{ source('raw_data', 'student_records') }}
)

SELECT
    caseid AS student_id,
    student_name,
    gender,
    county,
    level_of_study,
    name_of_school,
    owner_name,
    admission_number,
    favorite_meal,
    ward,
    sub_county,
    CURRENT_TIMESTAMP as loaded_at
FROM source
