# gmj-kit

A bunch of tools and utilties for gamejams in Godot.

## To do

* input
* shaders/particles/vfx
  * palette recoloring
  * explosion & tornado port?
  * vertical fog?
* card game
* load/save
* credits

## CI/CD

### Locally

* Install taskfile
* Set godot & butler paths on .envrc file
* `task upload`

### Gitlab

* Add secret API key as `BUTLER_API_KEY`
* rename file `.gitlab-ci.yml.disabled` to `.gitlab-ci.yml`
* set variables `PROJECT_NAME` & `ITCH_NAME`

## Things

### Gyro

A prototype of accesing accelerometer data in an web-export for mobile.
TODO: Qorking on chrome, unknown issue on firefox, permission issue on safari.

### Lofi

A subviewport trick that renders a 3d scene in lower resolution.

### Start menu

Literally the minimum start menu

### Skybox

A sokpop skybox. TODO: Recreate more exactly