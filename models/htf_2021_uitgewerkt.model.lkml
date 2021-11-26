connection: "htf2021"

# include all the views
include: "/views/**/*.view"

datagroup: htf_2021_uitgewerkt_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf_2021_uitgewerkt_default_datagroup

explore: aib_bnbs_nyc {}

explore: event_reviews {
  join: events {
    type: left_outer
    sql_on: ${event_reviews.event_id} = ${events.id} ;;
    relationship: many_to_one
  }
}

explore: companies {}

explore: ages {}

explore: bnbreservations {}

explore: bnbcheckins {}

explore: company_employees {}

explore: appearance {}

explore: events {}

explore: financial_status {}

explore: locations {}

explore: gender {}

explore: nationalities {}

explore: physical_characteristics {}

explore: people {}

explore: religions {}

explore: ride_info {}

explore: roles {}

explore: ride_passengers {}

explore: sub_departments {}

explore: taxi_rides {
  join: taxis {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${taxis.id} ;;
    relationship: many_to_one
  }
}

explore: taxis {}
