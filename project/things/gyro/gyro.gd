extends Node

var _dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
var _permission_cb = JavaScriptBridge.create_callback(asked_for_permission)

func _ready() -> void:
	var window = JavaScriptBridge.get_interface("window")
	window.ondeviceorientation = _dev_orientation
	# window.addEventListener("deviceorientation", on_device_orientation, true)
	$CenterContainer/Label.text = "On ready!"
	var dev_orientation = JavaScriptBridge.get_interface("DeviceOrientationEvent")
	$CenterContainer/Label.text += "\n{}\n{}".format([dev_orientation, on_device_orientation], "{}")
	# if JavaScriptBridge.eval("typeof DeviceOrientationEvent.requestPermission === 'function'"):
	# 	$CenterContainer/Label.text += "\nPermission needed"
	# 	dev_orientation.requestPermission().then(_permission_cb)
	# else:
	# 	$CenterContainer/Label.text += "\nNo permission needed"
	# 	JavaScriptBridge.get_interface("window").ondeviceorientation = _dev_orientation
	
func on_device_orientation(args) -> void:
	var rot = args[0]
	print(type_string(typeof(rot.beta)))
	var x = clamp(float(rot.beta), -90.0, 90.0) + 90.0
	var y = float(rot.gamma) + 90.0
	var window = get_window()
	var xx = remap(x, 0.0, 180.0, 0.0, window.size.x)
	var yy = remap(y, 0.0, 180.0, 0.0, window.size.y)
	$Ball.position = Vector2(xx, yy)
	# $CenterContainer/Label.text = "{} {}".format([xx, yy], "{}")

func asked_for_permission(args) -> void:
	var permission = args[0]
	if permission == "granted":
		$CenterContainer/Label.text += "\nPermission granted"
		JavaScriptBridge.get_interface("window").ondeviceorientation = _dev_orientation
	else:
		$CenterContainer/Label.text += "\nPermission not granted"
		$CenterContainer/Label.text += "\nPermission value {}".format([permission], "{}")
