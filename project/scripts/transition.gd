extends ColorRect


func _ready() -> void:
	var tw = create_tween()
	tw.set_trans(Tween.TRANS_SINE)
	tw.tween_property(self, "color:a", 1, 1)
	tw.tween_property(self, "color:a", 0, 1)
