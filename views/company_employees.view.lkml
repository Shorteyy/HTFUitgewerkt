view: company_employees {
  sql_table_name: `datasources.CompanyEmployees`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: sub_department {
    type: number
    sql: ${TABLE}.SubDepartment ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
