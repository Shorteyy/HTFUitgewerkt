view: ages {
  sql_table_name: `datasources.Ages`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
