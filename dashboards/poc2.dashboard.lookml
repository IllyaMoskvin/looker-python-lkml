- dashboard: poc2
  title: "POC #2: MySQL Mimic"
  layout: grid
  preferred_viewer: dashboards-next

  rows:
    - elements: [kpi_linechart]
      height: 600


  elements:
    - name: kpi_linechart
      title: "KPI Trend"
      type: looker_line
      model: poc2
      explore: poc2
      dimensions: [poc2.date]
      sorts: [poc2.date asc]
      measures: [poc2.revenue]
      listen:
        foo: poc2.foo
        bar: poc2.bar


  filters:
    - name: foo
      title: "Foo"
      type: field_filter
      model: poc2
      explore: poc2
      field: poc2.foo
      default_value: "500"
      allow_multiple_values: false
      required: true
      ui_config:
        type: slider
        display: inline
        options:
          min: 0
          max: 1000

    - name: bar
      title: "Bar"
      type: string_filter
      default_value: "foobar"
      allow_multiple_values: False
      required: true
      ui_config:
        display: inline
