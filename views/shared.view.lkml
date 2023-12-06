view: shared {
  dimension: foo {
    description: "An example numeric dimension"
    type: number
  }

  dimension: bar {
    description: "An example string dimension"
    type: string
  }

  dimension: date {
    description: "An example date dimension"
    type: date
  }

  measure: revenue {
    description: "An example output measure"
    type: number
    sql: SUM(${TABLE}.revenue) ;;
  }
}
