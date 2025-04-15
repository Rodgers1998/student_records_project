{{ config(materialized='table') }}

SELECT
    a.student_id,
    a.total_score,
    a.number_of_subjects,
    a.subjects_selected,
    p.actual_subject_count,
    s.subject_name,
    s.score
FROM {{ ref('stg_academic_records') }} a
LEFT JOIN {{ ref('int_parsed_subjects') }} p USING (student_id)
LEFT JOIN {{ ref('stg_subject_scores') }} s USING (student_id)
