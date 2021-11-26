view: religions {
  sql_table_name: `datasources.Religions`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: religions {
    type: string
    sql: ${TABLE}.Religions ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
