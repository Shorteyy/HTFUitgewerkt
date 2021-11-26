view: gender {
  sql_table_name: `datasources.Gender`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
