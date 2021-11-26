view: physical_characteristics {
  sql_table_name: `datasources.PhysicalCharacteristics`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: bmi {
    type: number
    sql: ${TABLE}.BMI ;;
  }

  dimension: height_in_cm {
    type: number
    sql: ${TABLE}.HeightInCm ;;
  }

  dimension: is_smoker {
    type: yesno
    sql: ${TABLE}.IsSmoker ;;
  }

  dimension: weight_in_kg {
    type: number
    sql: ${TABLE}.WeightInKg ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
