# gmj-kit

A bunch of tools and utilties for gamejams in Godot.

## CI/CD

### Locally

* Install taskfile
* Set godot & butler paths on .envrc file
* `task upload`

### Gitlab

* Add secret API key as `BUTLER_API_KEY`
* rename file `.gitlab-ci.yml.disabled` to `.gitlab-ci.yml`
* set variables `PROJECT_NAME` & `ITCH_NAME`
