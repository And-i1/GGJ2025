extends RigidBody3D

func _process(delta):
	$Camera3D.translate(Vector3(global_position.x-$Camera3D.global_position.x,global_position.y-$Camera3D.global_position.y+3,global_position.z-$Camera3D.global_position.z))
