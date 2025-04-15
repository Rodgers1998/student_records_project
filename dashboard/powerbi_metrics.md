# Power BI Integration Metrics

## Source: fact_academic_performance

### Metrics
- Total Score per Student
- Number of Subjects Taken
- Actual Subject Count (from `int_parsed_subjects`)
- Score per Subject (from `stg_subject_scores`)
- Favorite Meals by County

## Integration Guide

1. Connect Power BI to your data warehouse (BigQuery, Snowflake, etc.)
2. Use DirectQuery or Scheduled Refresh for real-time dashboards.
3. Visuals to include:
   - Bar Chart: Scores per Subject
   - Table: Student Demographics with University Info
   - Pie Chart: Favorite Meals Distribution
