extends Node


var _dev_orientation 

func _ready() -> void:
	if Global.lvl == 1:
		$SubViewportContainer/SubViewport/Environment/SpaceProgress.play("nothing")
	elif Global.lvl == 2:
		$SubViewportContainer/SubViewport/Environment/SpaceProgress.play("stars")
	elif Global.lvl == 3:
		$SubViewportContainer/SubViewport/Environment/SpaceProgress.play("stars_comet")
	elif Global.lvl == 4:
		$SubViewportContainer/SubViewport/Environment/SpaceProgress.play("everything")
	$SubViewportContainer/SubViewport/Environment/Transitioner.play("outof_lvl")
	var timer = get_tree().create_timer(10)
	if Global.lvl != 4:
		timer.timeout.connect(Callable(self, "transition_into"))
	else:
		timer.timeout.connect(Callable(self, "credits"))
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

func transition_into():
	$SubViewportContainer/SubViewport/Environment/Transitioner.play("into_lvl")
	Global.add_sibling(preload("res://scenes/transitioninto.tscn").instantiate())
	
func credits():
	$CreditsAnimation.play("new_animation")


func _on_itch_pressed():
	window.location = "https://itch.io/jam/malagajam-weekend-19/rate/3268311"
