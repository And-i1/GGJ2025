extends Camera3D

func _process(delta):
	position.x = get_parent().get_node("Ball3D").position.x
	position.y = get_parent().get_node("Ball3D").position.y
