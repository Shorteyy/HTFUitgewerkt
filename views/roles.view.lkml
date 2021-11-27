view: roles {
  sql_table_name: `datasources.Roles`
    ;;

  dimension: job_description {
    type: string
    sql: ${TABLE}.JobDescription ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.JobId ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
