workflow "Update sub-modules" {
  resolves = ["Bump Git Submodules"]
  on = "schedule(0 1 * * *)"
}

action "Bump Git Submodules" {
  uses = "domdere/git-submodule-action@0.0.1"
  secrets = ["GITHUB_TOKEN"]
}
