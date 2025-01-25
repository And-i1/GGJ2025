extends Node

var _dev_orientation 
var curve = load("res://things/curve/new_curve.tres")
@export var scn : PackedScene
@onready var ball = $Ball3D
var rotationobjective

func _ready() -> void:
	if OS.get_name() == "Web":
		var window = JavaScriptBridge.get_interface("window")
		_dev_orientation = JavaScriptBridge.create_callback(on_device_orientation)
		window.ondeviceorientation = _dev_orientation
	
func on_device_orientation(args) -> void:
	var rot = args[0]
	var x = clamp(float(rot.gamma), -90.0, 90.0) + 90
	var y = float(rot.beta) + 90
	# var window = get_window()
	# var xx = remap(x, 0.0, 180.0, 0.0, window.size.x)
	# var yy = remap(y, 0.0, 180.0, 0.0, window.size.y)
	# $Ball.position = Vector2(xx, yy)
	#var xx = remap(x, 0, 180, -30, 30)
	#var yy = remap(y, 0, 180, -30, 30)
	var xx = curve.sample(x/180)
	var yy = curve.sample(y/180)
	rotationobjective = Vector3(xx, 0, yy)
	#$Debug.text = "x = {}\ny = {}".format(["%.2f" % xx, "%.2f" % yy], "{}")

func _physics_process(delta):
	$Plane.rotation_degrees = Vector3(move_toward($Plane.rotation_degrees.x, rotationobjective.x, 1)/$Plane.global_position.distance_to(ball.global_position), 0, move_toward($Plane.rotation_degrees.z, rotationobjective.z, 1)/$Plane.global_position.distance_to(ball.global_position))

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if ball != null:
			ball.queue_free()
		ball = scn.instantiate()
		add_child(ball, true)



func _on_area_3d_area_entered(area):
	if ball != null:
		ball.queue_free()
	ball = scn.instantiate()
	add_child(ball, true)
