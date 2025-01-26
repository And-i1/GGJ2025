extends Node3D


func _on_area_3d_area_entered(area):
	if "ball" in area.name:
		Global.lvl += 1
		Global.add_sibling(preload("res://scenes/transition.tscn").instantiate())
		$Area3D.monitoring = false
