extends RigidBody3D

func _process(delta):
	$Camera3D.translate(global_position-$Camera3D.global_position + Vector3(0,3,0))
