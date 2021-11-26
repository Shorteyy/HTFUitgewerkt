view: sub_departments {
  sql_table_name: `datasources.SubDepartments`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: id_1 {
    type: number
    sql: ${TABLE}.ID_1 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
