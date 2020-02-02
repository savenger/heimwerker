extends Sprite

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			get_parent().get_node("MessageAnimation").play_backwards("IncomingMessage")
