extends Node

var x_basis = 180
var y_basis = 180

func _ready() -> void:
	var size = get_viewport().size
	$Debug.text = "{}x{}".format([size[0], size[1]], "{}")
	var max_x_scaling = size[0] / x_basis
	var max_y_scaling = size[1] / y_basis
	var min_scale = min(max_x_scaling, max_y_scaling)
	$SubViewportContainer.size = Vector2()
	
