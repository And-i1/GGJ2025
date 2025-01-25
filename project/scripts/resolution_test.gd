extends Node


var _dev_orientation 

func _ready() -> void:
	if OS.get_name() == "Web":
		var window = JavaScriptBridge.get_interface("window")
		_dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
		window.ondeviceorientation = _dev_orientation

func on_device_orientation(args) -> void:
	var rot = args[0]
	var x = clamp(float(rot.gamma), -90.0, 90.0) + 90
	var y = float(rot.beta) + 90
	var z = remap(x, 0, 180, -30, -16)
	$SubViewportContainer/SubViewport/Environment/Camera.rotation_degrees.y = z
