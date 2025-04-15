SELECT *
FROM {{ ref('stg_academic_records') }}
WHERE total_score < 0
