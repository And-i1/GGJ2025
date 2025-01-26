extends Node


var _dev_orientation 

func _ready() -> void:
	if OS.get_name() == "Web":
		var window = JavaScriptBridge.get_interface("window")
		_dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
		window.ondeviceorientation = _dev_orientation
		# await get_tree().create_timer(5).timeout
		# window.location = "https://itch.io/jam/malagajam-weekend-19/rate/3268311"

func on_device_orientation(args) -> void:
	var rot = args[0]
	var x = clamp(float(rot.gamma), -90.0, 90.0) + 90
	var y = float(rot.beta) + 90
	var xx = remap(x, 0, 180, -30, -16)
	var yy = remap(y, 0, 180, -15, 15)
	$SubViewportContainer/SubViewport/Environment/Camera.rotation_degrees.y = xx
	$SubViewportContainer/SubViewport/Environment/Camera.rotation_degrees.x = yy
