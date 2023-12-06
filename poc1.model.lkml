connection: "dsal-poc1-postgres"

include: "/views/poc1.view.lkml"
include: "/dashboards/poc1.dashboard.lookml"

explore: poc1 {
  persist_for: "0 seconds"
}
