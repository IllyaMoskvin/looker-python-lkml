connection: "dsal-poc2-mysql"

include: "/views/poc2.view.lkml"
include: "/dashboards/poc2.dashboard.lookml"

explore: poc2 {
  persist_for: "0 seconds"
}
