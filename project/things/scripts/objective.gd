extends Node3D

@export var scn : PackedScene
signal change_scene

func _on_area_3d_area_entered(area):
	if "ball" in area.name:
		change_scene.emit()
