view: locations {
  sql_table_name: `datasources.Locations`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
