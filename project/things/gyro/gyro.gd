extends Node

var _dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
var _permission_cb = JavaScriptBridge.create_callback(asked_for_permission)

func _ready() -> void:
	$CenterContainer/Label.text = "On ready"
	var window = JavaScriptBridge.get_interface("window")
	var dev_orientation = JavaScriptBridge.get_interface("DeviceOrientationEvent")
	if JavaScriptBridge.eval("typeof DeviceOrientationEvent.requestPermission === 'function'"):
		$CenterContainer/Label.text += "\nPermission needed "
		dev_orientation.requestPermission().then(_permission_cb)
	else:
		$CenterContainer/Label.text += "\nNo permission needed"
		window.ondeviceorientation = _dev_orientation
	
func on_device_orientation(args) -> void:
	var rot = args[0]
	$CenterContainer/Label.text += "\n{} {} {}".format([rot.alpha, rot.beta, rot.gamma], "{}")

func asked_for_permission(args) -> void:
	var permission_state = args[0]
	if permission_state == "\ngranted":
		$CenterContainer/Label.text += "\nPermission granted for DeviceOrientation "
		JavaScriptBridge.get_interface("window").ondeviceorientation = _dev_orientation
	else:
		$CenterContainer/Label.text += "\nPermission not granted for DeviceOrientation "
