extends AudioStreamPlayer

func _play():
	$"/root/BGMusic".play(0.0)


func _on_BGMusic_finished():
	_play()
