extends Camera3D

func _process(delta):
	set_position(get_parent().get_child(3).position + 3)
