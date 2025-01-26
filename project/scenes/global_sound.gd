extends AudioStreamPlayer

var audiopos = 0

func play_space():
	play(audiopos)
	$AnimationPlayer.play("play")

func pause_space():
	audiopos = get_playback_position()
	$AnimationPlayer.play("pause")
	await $AnimationPlayer.animation_finished
	stop()
	
