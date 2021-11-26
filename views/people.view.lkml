view: people {
  sql_table_name: `datasources.People`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: full_name {
    type:  string
    sql:  ${first_name}|| ' ' || ${last_name} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
