extends SubViewportContainer

var basis := Vector2i(180, 320)


func _process(_delta: float) -> void:
	var vsize := DisplayServer.window_get_size()
	var max_factor := vsize / basis
	var min_factor : int = min(max_factor[0], max_factor[1])
	size = Vector2(basis * min_factor)
	position = (Vector2(vsize) - size) / 2
	scale = Vector2(min_factor, min_factor)
	$SubViewport.size = basis
	
