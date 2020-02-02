extends Sprite

export (int) var ended = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed() and not ended:
			get_parent().get_node("MessageAnimation").play_backwards("IncomingMessage")
			ended = true
