extends Node

var x_basis = 180
var y_basis = 320

func _process(_delta: float) -> void:
	var size = get_viewport().size
	var max_x_scaling = size[0] / x_basis
	var max_y_scaling = size[1] / y_basis
	var min_scale = min(max_x_scaling, max_y_scaling)
	$SubViewportContainer.size = Vector2(x_basis * min_scale, y_basis * min_scale)
	$SubViewportContainer.size = Vector2(x_basis * min_scale, y_basis * min_scale)
	$SubViewportContainer.scale = Vector2(min_scale, min_scale)
	$SubViewportContainer/SubViewport.size = Vector2(x_basis, y_basis)
	$Debug.text = "{}x{}\ns={}".format([size[0], size[1], min_scale], "{}")
	
