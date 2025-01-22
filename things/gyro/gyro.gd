extends Node


func _ready() -> void:
	var window = JavaScriptBridge.get_interface("window")
	window.ondeviceorientation = print_orientation
	
func print_orientation(event) -> void:
	$CenterContainer/Label.text = str(event)
