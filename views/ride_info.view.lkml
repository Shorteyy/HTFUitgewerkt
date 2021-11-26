view: ride_info {
  sql_table_name: `datasources.RideInfo`
    ;;

  dimension: dropoff_location {
    type: number
    sql: ${TABLE}.DropoffLocation ;;
  }

  dimension: num_passengers {
    type: number
    sql: ${TABLE}.NumPassengers ;;
  }

  dimension: pickup_location {
    type: number
    sql: ${TABLE}.PickupLocation ;;
  }

  dimension_group: pickup {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.PickupTime ;;
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
