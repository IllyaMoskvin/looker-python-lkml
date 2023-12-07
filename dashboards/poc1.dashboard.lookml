- dashboard: poc1
  title: "POC #1: API + Button"
  layout: grid
  preferred_viewer: dashboards-next

  rows:
    - elements: [get_results]
      height: 250
    - elements: [kpi_linechart]
      height: 600


  elements:
    - name: get_results
      type: single_value
      model: poc1
      explore: poc1
      measures: [poc1.run_model_button]
      show_single_value_title: false
      filters:
        poc1.is_button: "Yes"
      listen:
        foo: poc1.foo
        bar: poc1.bar

    - name: kpi_linechart
      title: "Projected Revenue"
      type: looker_line
      model: poc1
      explore: poc1
      dimensions: [poc1.date]
      sorts: [poc1.date asc]
      measures: [poc1.revenue]
      listen:
        foo: poc1.foo
        bar: poc1.bar


  filters:
    - name: foo
      title: "Foo"
      type: field_filter
      model: poc1
      explore: poc1
      field: poc1.foo
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
      default_value: "A"
      allow_multiple_values: False
      required: true
      ui_config:
        type: button_toggles
        display: inline
        options:
         - "A"
         - "B"
         - "C"
