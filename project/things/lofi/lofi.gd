extends SubViewportContainer


var basis := Vector2i(180, 320)

func _process(_delta: float) -> void:
	var vsize := DisplayServer.window_get_size()
	var max_scaled := vsize / basis
	var min_scale := min(max_scale)
	size = Vector2(x_basis * min_scale, y_basis * min_scale)
	position = (size - Vector2i(x_basis, y_basis) * min_scale) / 2
	$SubViewportContainer.scale = Vector2(min_scale, min_scale)
	$SubViewportContainer/SubViewport.size = Vector2(x_basis, y_basis)
	$Debug.text = "{}x{}\ns={}\n{}\n{}".format([size[0], size[1], min_scale, $SubViewportContainer.position[0], $SubViewportContainer.position[1]], "{}")
	
