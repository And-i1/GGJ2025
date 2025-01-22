extends Node

var _dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
var _permission_cb = JavaScriptBridge.create_callback(asked_for_permission)

func _ready() -> void:
	var window = JavaScriptBridge.get_interface("window")
	var dev_orientation = JavaScriptBridge.get_interface("DeviceOrientationEvent")
	if JavaScriptBridge.eval("typeof DeviceOrientationEvent.requestPermission === 'function'"):
		# ask for permission
		dev_orientation.requestPermission().then(_permission_cb)
	else:
		window.ondeviceorientation = _dev_orientation
	
func on_device_orientation(args) -> void:
	var rot = args[0]
	print("{} {} {}".format([rot.alpha, rot.alpha, rot.gamma]))
	$CenterContainer/Label.text = "{} {} {}".format([rot.alpha, rot.alpha, rot.gamma], "{}")

func asked_for_permission(args) -> void:
	var permission_state = args[0]
	if permission_state == "granted":
		JavaScriptBridge.get_interface("window").ondeviceorientation = _dev_orientation
	else:
		printerr("Permission not granted for DeviceOrientation")