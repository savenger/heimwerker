extends TextureRect

func _input(event):
	if event is InputEventMouseButton \
	and event.is_pressed():
		if event.button_index == BUTTON_LEFT:
			get_parent().get_node("StartTimer").stop()
			get_tree().change_scene("res://Start.tscn")
