view: locations {
  sql_table_name: `datasources.Locations`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: lattidue {
    type: string
    sql: SPLIT(${TABLE}.location, ", ")[SAFE_OFFSET(0)] ;;
  }

  dimension: longitude {
    type: string
    sql: SPLIT(${TABLE}.location, ", ")[SAFE_OFFSET(1)] ;;
  }

  dimension: location {
    type: location
    sql_latitude:${lattidue} ;;
    sql_longitude:${longitude} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
