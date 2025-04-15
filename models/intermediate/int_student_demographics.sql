{{ config(materialized='table') }}

SELECT
    s.student_id,
    s.student_name,
    s.gender,
    s.county,
    s.level_of_study,
    s.name_of_school,
    s.admission_number,
    s.ward,
    s.sub_county,
    CASE 
        WHEN s.favorite_meal = 'ugali_nyama' THEN 'Ugali with Meat'
        ELSE s.favorite_meal 
    END AS favorite_meal
FROM {{ ref('stg_students') }} s
