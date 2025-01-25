extends SubViewportContainer

var basis := Vector2i(90, 160)

func _ready():
	get_parent().get_node("gyro").queue_free()
	var main_scene = load(ProjectSettings.get_setting("application/run/main_scene")).instantiate()
	get_child(0).add_child(main_scene)
	get_node("SubViewport/gyro/Plane/Objective").change_scene.connect(change_scene.bind(get_node("SubViewport/gyro/Plane/Objective").scn))

	

func _process(_delta: float) -> void:
	var vsize := DisplayServer.window_get_size()
	var max_factor := vsize / basis
	var min_factor : int = min(max_factor[0], max_factor[1])
	size = Vector2(basis * min_factor)
	position = (Vector2(vsize) - size) / 2
	scale = Vector2(min_factor, min_factor)
	$SubViewport.size = basis
	$Debug.text = "{}x{}\n{}x{}".format([vsize[0], vsize[1], size[0], size[1]], "{}")

func change_scene(scene):
	get_child(0).get_child(0).queue_free()
	var scninstance = scene.instantiate()
	get_child(0).add_child(scninstance)
	
