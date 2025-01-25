extends RigidBody3D

func _ready():
	translate(-global_position)
func _process(delta):
	$CameraPivot.translate(global_position - $CameraPivot.global_position)
