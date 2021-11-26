view: bnbcheckins {
  sql_table_name: `datasources.BNBCheckins`
    ;;

  dimension: bnb_id1 {
    type: number
    sql: ${TABLE}.BnbId1 ;;
  }

  dimension: is_checked_in {
    type: yesno
    sql: ${TABLE}.IsCheckedIn ;;
  }

  dimension: person_id2 {
    type: number
    sql: ${TABLE}.PersonId2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
