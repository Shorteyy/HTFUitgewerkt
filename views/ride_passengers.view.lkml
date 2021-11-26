view: ride_passengers {
  sql_table_name: `datasources.RidePassengers`
    ;;

  dimension: passenger_id {
    type: number
    sql: ${TABLE}.PassengerId ;;
  }

  dimension: ride_id {
    type: number
    sql: ${TABLE}.RideID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
