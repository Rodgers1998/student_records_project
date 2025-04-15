{{ config(materialized='table') }}

WITH subject_list AS (
    SELECT
        student_id,
        subjects,
        string_to_array(subjects, ' ') AS subject_array
    FROM {{ ref('stg_academic_records') }}
    WHERE subjects IS NOT NULL AND subjects != '---'
)

SELECT
    student_id,
    subject_array AS parsed_subjects,
    array_length(subject_array, 1) AS actual_subject_count
FROM subject_list
