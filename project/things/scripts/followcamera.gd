extends Camera3D

func _process(delta):
	position.x = get_parent().get_node("Ball3D").position.x
	position.y = get_parent().get_node("Ball3D").position.y + 3
	position.z = get_parent().get_node("Ball3D").position.z
