- dashboard: poc1
  title: "POC #1: API + Button"
  layout: grid
  preferred_viewer: dashboards-next

  rows:
    - elements: [get_results]
      height: 100
    - elements: [kpi_linechart]
      height: 600


  elements:
    - name: get_results
      type: button
      # TODO: Refactor this to be a link with params
      # https://www.googlecloudcommunity.com/gc/Exploring-Curating-Data/Can-I-Pass-a-Parameter-Value-from-a-Dashboard-to-another-one/td-p/575090
      # https://www.googlecloudcommunity.com/gc/Modeling/Creating-hyperlinked-button-dimensions/td-p/572971
      rich_content_json: '{
        "text": "Run Model",
        "description": "Click, wait for model to run, then rerun query",
        "newTab": true,
        "alignment": "center",
        "size": "large",
        "style": "FILLED",
        "color": "blue",
        "href": "http://35.209.63.1761"
      }'

    - name: kpi_linechart
      title: "KPI Trend"
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
