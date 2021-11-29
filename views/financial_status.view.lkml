view: financial_status {
  sql_table_name: `datasources.FinancialStatus`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: bruto_income {
    type: number
    sql: ${TABLE}.BrutoIncome ;;
  }

  dimension: debt {
    type: number
    sql: ${TABLE}.Debt ;;
  }

  dimension: net_worth {
    type: number
    sql: ${TABLE}.NetWorth ;;
  }

  measure: total_bruto_income {
    type: sum
    sql:  ${bruto_income};;
    drill_fields: [
      id
    ]
  }

  measure: total_net_worth {
    type: sum
    sql:  ${net_worth};;
    drill_fields: [
      id
    ]
  }

  measure: total_debt {
    type: sum
    sql:  ${debt};;
    drill_fields: [
      id
    ]
  }

  measure: total_net_worth_without_dept {
    type: number
    sql:  ${total_net_worth} - ${total_debt};;
    drill_fields: [
      id
    ]
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
