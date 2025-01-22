extends Node

var _dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
var _permission_cb = JavaScriptBridge.create_callback(asked_for_permission)

func _ready() -> void:
	var window = JavaScriptBridge.get_interface("window")
	window.myFunc()
	# await get_tree().create_timer(2).timeout
	# $CenterContainer/Label.text = "On ready!"
	# var dev_orientation = JavaScriptBridge.get_interface("DeviceOrientationEvent")
	# if JavaScriptBridge.eval("typeof DeviceOrientationEvent.requestPermission === 'function'"):
	# 	$CenterContainer/Label.text += "\nPermission needed"
	# 	dev_orientation.requestPermission().then(_permission_cb)
	# else:
	# 	$CenterContainer/Label.text += "\nNo permission needed"
	# 	JavaScriptBridge.get_interface("window").ondeviceorientation = _dev_orientation
	
func on_device_orientation(args) -> void:
	var rot = args[0]
	$CenterContainer/Label.text += "{} {} {}".format([rot.alpha, rot.beta, rot.gamma], "{}")

func asked_for_permission(args) -> void:
	var permission = args[0]
	if permission == "granted":
		$CenterContainer/Label.text += "\nPermission granted"
		JavaScriptBridge.get_interface("window").ondeviceorientation = _dev_orientation
	else:
		$CenterContainer/Label.text += "\nPermission not granted"
		$CenterContainer/Label.text += "\nPermission value {}".format([permission], "{}")
