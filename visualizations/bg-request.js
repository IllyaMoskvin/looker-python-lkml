looker.plugins.visualizations.add({
  options: {
    font_size: {
      type: "string",
      label: "Font Size",
      values: [
        {"Large": "large"},
        {"Small": "small"}
      ],
      display: "radio",
      default: "large"
    }
  },
  // Set up the initial state of the visualization
  create: function(element, config) {

    // Test Mithril
    m.render(element, [
      m("main", [
        m("pre", JSON.stringify(config)),
      ])
    ])

  },
  // Render in response to the data or settings changing
  updateAsync: function(data, element, config, queryResponse, details, done) {

    // Clear any errors from previous updates
    this.clearErrors();

    // Throw some errors and exit if the shape of the data isn't what this chart needs
    // if (queryResponse.fields.dimensions.length == 0) {
    //   this.addError({title: "No Dimensions", message: "This chart requires dimensions."});
    //   return;
    // }

    // Grab the first cell of the data
    var firstRow = data[0];
    var firstCell = firstRow[queryResponse.fields.dimensions[0].name];

    // Insert the data with mithril
    m.render(element, [
      m("main", [
        m("h4", "Data"),
        m("pre", JSON.stringify(data)),
        m("h4", "Config"),
        m("pre", JSON.stringify(config)),
        m("h4", "Details"),
        m("pre", JSON.stringify(details)),
        m("h4", "First Cell"),
        m("p", firstCell),
      ])
    ])

    // Insert the data into the page
    // this._textElement.innerHTML = LookerCharts.Utils.htmlForCell(firstCell);

    // Set the size to the user-selected size
    // if (config.font_size == "small") {
    //   this._textElement.className = "hello-world-text-small";
    // } else {
    //   this._textElement.className = "hello-world-text-large";
    // }

    // We are done rendering! Let Looker know.
    done()
  }
});