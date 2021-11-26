view: event_reviews {
  sql_table_name: `datasources.EventReviews`
    ;;

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.EventId ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.Rating ;;
  }

  dimension: review_id {
    type: number
    sql: ${TABLE}.ReviewId ;;
  }

  measure: count {
    type: count
    drill_fields: [events.id, events.name]
  }
}
