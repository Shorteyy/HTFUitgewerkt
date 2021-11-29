connection: "htf2021"

# include all the views
include: "/views/**/*.view"

datagroup: htf_2021_uitgewerkt_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: htf_2021_uitgewerkt_default_datagroup

explore: aib_bnbs_nyc {
  join: bnbcheckins {
    type: left_outer
    sql_on:  ${aib_bnbs_nyc.id} = ${bnbcheckins.bnb_id1} ;;
    relationship: many_to_one
  }

  join: bnbreservations {
    type: left_outer
    sql_on:  ${aib_bnbs_nyc.id} = ${bnbreservations.bnbid} ;;
    relationship: many_to_one
  }
}

explore: event_reviews {

}

explore: companies {
  join: sub_departments {
    type: left_outer
    sql_on:  ${companies.id} = ${sub_departments.id} ;;
    relationship: one_to_many
  }
}

explore: ages {}

explore: bnbreservations {
  join: people {
    type: left_outer
    sql_on:  ${bnbreservations.person_id} = ${people.id} ;;
    relationship: one_to_many
  }
}

explore: bnbcheckins {
  join: people {
    type: left_outer
    sql_on:  ${bnbcheckins.person_id2} = ${people.id} ;;
    relationship: one_to_many
  }
}

explore: company_employees {
  join: sub_departments {
    type: left_outer
    sql_on:  ${company_employees.sub_department} = ${sub_departments.id} ;;
    relationship: one_to_many
  }
}

explore: appearance {}

explore: events {
  join: event_reviews {
    type: left_outer
    sql_on: ${events.id} = ${event_reviews.event_id};;
    relationship: one_to_many
  }

  join: locations {
    type: inner
    sql_on: ${events.id} = ${locations.id};;
    relationship: one_to_one
  }

  join: ride_info {
    type: inner
    required_joins: [locations]
    sql_on: ${locations.id} = ${ride_info.pickup_location} ;;
    relationship: one_to_one
  }

  join: ride_passengers {
    type: left_outer
    required_joins: [ride_info]
    sql_on: ${ride_info.ride_id} = ${ride_passengers.ride_id} ;;
    relationship: one_to_many
  }

  join: people {
    type: left_outer
    required_joins: [ride_passengers]
    sql_on: ${ride_passengers.passenger_id} = ${people.id} ;;
    relationship: one_to_one
  }

  join: locations_pickup {
    from: locations
    type: inner
    sql_on: ${events.id} = ${locations.id};;
    relationship: one_to_one
  }
}

explore: financial_status {
  join: people {
    type: left_outer
    sql_on: ${people.id} = ${financial_status.id} ;;
    relationship: many_to_one
  }

  join: ride_passengers {
    type: left_outer
    required_joins: [people]
    sql_on: ${people.id} = ${ride_passengers.passenger_id} ;;
    relationship: one_to_many
  }

  join: ride_info {
    type: inner
    required_joins: [ride_passengers]
    sql_on: ${ride_passengers.ride_id} = ${ride_info.ride_id} ;;
    relationship: many_to_one
  }
}

explore: locations {
  join: events {
    type: inner
    sql_on: ${locations.id} = ${events.id};;
    relationship: one_to_one
  }

  join: ride_info_location_pickup {
    from:  ride_info
    type: inner
    sql_on: ${locations.id} = ${ride_info_location_pickup.pickup_location} ;;
    relationship: many_to_one
  }

  join: ride_info_location_dropoff {
    from:  ride_info
    type: inner
    sql_on: ${locations.id} = ${ride_info_location_dropoff.dropoff_location} ;;
    relationship: many_to_one
  }

  join: ride_passengers {
    type: left_outer
    required_joins: [ride_info_location_pickup]
    sql_on: ${ride_info_location_pickup.ride_id} = ${ride_passengers.ride_id};;
    relationship: one_to_many
  }

  join: people {
    type: left_outer
    required_joins: [ride_passengers]
    sql_on: ${ride_passengers.passenger_id} = ${people.id};;
    relationship: one_to_one
  }
}

explore: gender {}

explore: nationalities {}

explore: physical_characteristics {}

explore: people {
  join: financial_status {
    type: left_outer
    sql_on: ${people.id} = ${financial_status.id} ;;
    relationship: one_to_many
  }

  join: physical_characteristics {
    type: left_outer
    sql_on: ${people.id} = ${physical_characteristics.id} ;;
    relationship: one_to_many
  }

  join: ages {
    type: left_outer
    sql_on: ${people.id} = ${ages.id} ;;
    relationship: one_to_many
  }

  join: gender {
    type: left_outer
    sql_on: ${people.id} = ${gender.id} ;;
    relationship: one_to_many
  }

  join: appearance {
    type: left_outer
    sql_on: ${people.id} = ${appearance.id} ;;
    relationship: one_to_many
  }

  join: religions {
    type: left_outer
    sql_on: ${people.id} = ${religions.id} ;;
    relationship: one_to_many
  }

  join: roles {
    type: left_outer
    sql_on: ${people.id} = ${roles.person_id} ;;
    relationship: one_to_many
  }

  join: company_employees {
    type: left_outer
    sql_on: ${people.id} = ${company_employees.id} ;;
    relationship: one_to_one
  }

  join: sub_departments {
    type: left_outer
    required_joins: [company_employees]
    sql_on: ${company_employees.sub_department} = ${sub_departments.id_1} ;;
    relationship: one_to_one
  }

  join: companies {
    type: left_outer
    required_joins: [sub_departments]
    sql_on: ${sub_departments.id} = ${companies.id} ;;
    relationship: one_to_many
  }

  join: nationalities {
    type: left_outer
    sql_on: ${people.id} = ${nationalities.id} ;;
    relationship: one_to_many
  }

  join: bnbreservations {
    type: left_outer
    sql_on: ${people.id} = ${bnbreservations.person_id} ;;
    relationship: one_to_many
  }

  join: bnbcheckins {
    type: left_outer
    sql_on: ${people.id} = ${bnbcheckins.person_id2}   ;;
    relationship: one_to_many
  }

  join: ride_passengers {
    type: inner
    sql_on: ${people.id} = ${ride_passengers.passenger_id};;
    relationship: many_to_many
  }

  join: ride_info {
    type: left_outer
    required_joins: [ride_passengers]
    sql_on: ${ride_passengers.ride_id} = ${ride_info.ride_id};;
    relationship: one_to_one
  }

  join: events {
    type: left_outer
    required_joins: [ride_info]
    sql_on: ${ride_info.pickup_location} = ${events.id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    required_joins: [events]
    sql_on: ${events.id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: religions {}

explore: ride_info {
  join: taxi_rides {
    type: inner
    sql_on: ${ride_info.ride_id} = ${taxi_rides.id} ;;
    relationship: one_to_one
  }

  join: pickup_location {
    from:  locations
    type: inner
    sql_on: ${ride_info.pickup_location} = ${pickup_location.id} ;;
    relationship: many_to_one
  }

  join: pickup_event {
    from:  events
    type: left_outer
    required_joins: [pickup_location]
    sql_on: ${pickup_event.id} = ${pickup_location.id};;
    relationship: one_to_one
  }

  join: dropoff_location {
    from:  locations
    type: inner
    sql_on: ${ride_info.dropoff_location} = ${dropoff_location.id} ;;
    relationship: many_to_one
  }

  join: dropoff_event {
    from:  events
    type: left_outer
    required_joins: [dropoff_location]
    sql_on: ${dropoff_event.id} = ${dropoff_location.id};;
    relationship: one_to_one
  }

  join: ride_passengers {
    type: inner
    sql_on: ${ride_info.ride_id} = ${ride_passengers.ride_id} ;;
    relationship: one_to_many
  }

  join: people {
    type: left_outer
    required_joins: [ride_passengers]
    sql_on: ${ride_passengers.passenger_id} = ${people.id} ;;
    relationship: one_to_one
  }

  join: all_possible_next_ride_info {
    from:  ride_info
    type: left_outer
    sql_on: ${ride_info.dropoff_location} = ${all_possible_next_ride_info.pickup_location};;
    relationship: one_to_many
  }

  join: all_possible_next_ride_passengers {
    from:  ride_passengers
    type: left_outer
    required_joins: [all_possible_next_ride_info]
    sql_on: ${all_possible_next_ride_info.ride_id} = ${all_possible_next_ride_passengers.ride_id};;
    relationship: one_to_many
  }

  join: the_next_ride_info {
    from:  ride_info
    type: inner
    required_joins: [all_possible_next_ride_passengers, people]
    sql_on:  ${the_next_ride_info.ride_id} = ${all_possible_next_ride_passengers.ride_id} and ${people.id} = ${all_possible_next_ride_passengers.passenger_id};;
    relationship: one_to_one
  }

  join: the_next_ride_passengers {
    from:  ride_passengers
    type: inner
    required_joins: [the_next_ride_info]
    sql_on:  ${the_next_ride_passengers.ride_id} = ${the_next_ride_info.ride_id};;
    relationship: one_to_one
  }


}

explore: roles {
  join: people {
    type: left_outer
    sql_on: ${roles.person_id} = ${people.id} ;;
    relationship: many_to_one
  }
}

explore: ride_passengers {
  join: taxi_rides {
    type: left_outer
    sql_on:  ${ride_passengers.ride_id} = ${taxi_rides.id};;
    relationship: many_to_one
  }

  join: people {
    type: inner
    sql_on:  ${ride_passengers.ride_id} = ${people.id};;
    relationship: many_to_many
  }
}

explore: sub_departments {}

explore: taxi_rides {
  join: taxis {
    type: left_outer
    sql_on: ${taxi_rides.taxi_id} = ${taxis.id} ;;
    relationship: many_to_one
  }

  join: ride_info {
    type: inner
    sql_on: ${taxi_rides.id} = ${ride_info.ride_id} ;;
    relationship: one_to_one
  }

  join: ride_passengers {
    type: left_outer
    sql_on: ${taxi_rides.id} = ${ride_passengers.ride_id} ;;
    relationship: one_to_many
  }

  join: people {
    type: left_outer
    required_joins: [ride_passengers]
    sql_on: ${ride_passengers.passenger_id} = ${people.id} ;;
    relationship: one_to_one
  }
}

explore: taxis {
  join: taxi_rides {
    type: left_outer
    sql_on: ${taxis.id} = ${taxi_rides.taxi_id} ;;
    relationship: one_to_many
  }
}
