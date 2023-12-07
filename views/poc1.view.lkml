include: "/views/shared.view.lkml"

view: poc1 {
  extends: [shared]

  derived_table: {
    sql:
      (SELECT foo, bar, date, revenue FROM poc1)
      {% if is_button._in_query %}
      -- Button single-value tile needs at least one result to render, so we
      -- return one hard-coded result that always matches current filter values
      UNION (
        SELECT
          CAST({{ _filters['poc1.foo'] | sql_quote }} AS INT) AS foo,
          {{ _filters['poc1.bar'] | sql_quote }} AS bar,
          NULL AS date,
          NULL AS revenue
      )
      {% endif %}
    ;;
  }

  parameter: is_button {}

  measure: run_model_button {
    type: string
    sql: '' ;;
    html:
      {%- assign foo = _filters["poc1.foo"] | url_encode -%}
      {%- assign bar = _filters["poc1.bar"] | url_encode -%}
      <ol style="font-size: 1rem;line-height: 1.5rem;text-align: left;width: 400px;margin: 0 auto 20px;">
        <li>Select values for "Foo" and "Bar" filters</li>
        <li>Click "Update" and wait for query to complete</li>
        <li>If line chart says "No results", click "Run Model"</li>
        <li>Wait for the page that pops up to say that results are ready</li>
        <li>Tab back to Looker, wait a moment, and re-run your query</li>
      </ol>
      <a
        href="http://looker-py-poc1.imoskvin.com?foo={{ foo }}&bar={{ bar }}" target="_new"
        style="font-size: 30px; line-height: 30px;"
      >Run Model</a>
    ;;
  }
}
