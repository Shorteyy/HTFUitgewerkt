view: taxi_rides {
  sql_table_name: `datasources.TaxiRides`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: taxi_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.TaxiID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, taxis.id]
  }
}
