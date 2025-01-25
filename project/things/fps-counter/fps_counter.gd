extends Control


var delta_array := PackedFloat32Array()
var current_idx : int = 0
var moving_total : float = 0

func _ready() -> void:
	delta_array.resize(100)


func _process(delta: float) -> void:
	moving_total -= delta_array[current_idx]
	moving_total += delta
	delta_array[current_idx] = delta
	current_idx = (current_idx + 1) % 100
	$Debug.text = "{} fps".format(["%.2f" % (1 / (moving_total / 100))], "{}")
