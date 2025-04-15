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
    s.favorite_meal,
    u.university,
    u.course
FROM {{ ref('int_student_demographics') }} s
LEFT JOIN {{ ref('stg_university_info') }} u USING (student_id)
