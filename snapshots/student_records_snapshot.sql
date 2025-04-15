{% snapshot student_records_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='caseid',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

SELECT * FROM {{ source('raw_data', 'student_records') }}

{% endsnapshot %}
