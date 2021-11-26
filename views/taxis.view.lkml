view: taxis {
  sql_table_name: `datasources.Taxis`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: expens_rating {
    type: number
    sql: ${TABLE}.ExpensRating ;;
  }

  dimension: experience_rating {
    type: number
    sql: ${TABLE}.ExperienceRating ;;
  }

  dimension: kindness_rating {
    type: number
    sql: ${TABLE}.KindnessRating ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.Owner ;;
  }

  measure: count {
    type: count
    drill_fields: [id, taxi_rides.count]
  }
}
