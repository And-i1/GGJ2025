extends Node3D

@export var scn : PackedScene

func _on_area_3d_area_entered(area):
	if "ball" in area.name:
		Global.lvl += 1
		get_tree().change_scene_to_packed(Global.ship)
