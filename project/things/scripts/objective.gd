extends Node3D

@export var scn : PackedScene

func _on_area_3d_area_entered(area):
	if "ball" in area.name:
		get_tree().change_scene_to_file(scn.get_path())
