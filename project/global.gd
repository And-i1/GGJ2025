extends Node

var ship = load("res://scenes/resolution-test.tscn")
var lvl = 0

func _ready():
	get_node("/root/gyro").queue_free()
	get_node("/root/Lofi/SubViewport").add_child(preload("res://scenes/level1.tscn").instantiate())
