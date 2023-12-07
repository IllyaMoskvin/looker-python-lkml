project_name: "python"

# Documentation on manifest files: https://cloud.google.com/looker/docs/lookml-project-files#project_manifest_files


# Custom Viz for background requests to a Python service
visualization: {
  id: "dsal-bg-request"
  label: "DSAL - Python Request"
  dependencies: ["https://cdnjs.cloudflare.com/ajax/libs/mithril/2.2.3/mithril.min.js"]
  file: "visualizations/bg-request.js"
}
