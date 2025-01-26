extends ColorRect


func _ready() -> void:
	var tw = create_tween()
	tw.set_trans(Tween.TRANS_SINE)
	tw.tween_property(self, "color:a", 1, 1)
	tw.tween_property(self, "color:a", 0, 1)
	var timer = get_tree().create_timer(1)
	await timer.timeout
	get_tree().change_scene_to_packed(load(str("res://scenes/level%.tscn",Global.lvl)))
	timer = get_tree().create_timer(1)
	await timer.timeout
	get_parent().get_parent().queue_free()
