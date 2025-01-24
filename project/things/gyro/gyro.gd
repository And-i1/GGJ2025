extends Node

var _dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)

func _ready() -> void:
	var window = JavaScriptBridge.get_interface("window")
	window.ondeviceorientation = _dev_orientation
	
func on_device_orientation(args) -> void:
	var rot = args[0]
	var x = clamp(float(rot.gamma), -90.0, 90.0) + 90
	var y = float(rot.beta) + 90
	var window = get_window()
	var xx = remap(x, 0.0, 180.0, 0.0, window.size.x)
	var yy = remap(y, 0.0, 180.0, 0.0, window.size.y)
	$Ball.position = Vector2(xx, yy)
