view: bnbreservations {
  sql_table_name: `datasources.BNBReservations`
    ;;

  dimension: bnbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.BNBId ;;
  }

  dimension: deposit {
    type: number
    sql: ${TABLE}.Deposit ;;
  }

  dimension_group: end_visit {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndVisit ;;
  }

  dimension: is_paid {
    type: yesno
    sql: ${TABLE}.IsPaid ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.PersonId ;;
  }

  dimension_group: start_visit {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartVisit ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
