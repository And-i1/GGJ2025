extends Node3D

@export var scn : PackedScene

func _on_area_3d_body_entered(body):
	if "ball" in body.name:
		get_tree().change_scene_to_packed(scn)
