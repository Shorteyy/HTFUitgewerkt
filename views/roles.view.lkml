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

  measure: job_description_list {
    type: list
    list_field: job_description
  }
}
