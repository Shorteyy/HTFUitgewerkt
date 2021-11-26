view: appearance {
  sql_table_name: `datasources.Appearance`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: eye_color {
    type: string
    sql: ${TABLE}.EyeColor ;;
  }

  dimension: hair_color {
    type: string
    sql: ${TABLE}.HairColor ;;
  }

  dimension: skin_color {
    type: string
    sql: ${TABLE}.SkinColor ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
