extends RigidBody3D

func _process(delta):
	$CameraPivot.translate(global_position-$CameraPivot.global_position)
