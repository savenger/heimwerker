extends Sprite

export (int) var first = true
export (int) var ended = false

func _input(event):
	if ended:
		return
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			if first:
				first = false
				var mt = get_parent().get_parent().message_type
				var e = get_parent().get_parent().FELIX_MESSAGE_TYPE
				if mt == e.WELCOME:
					get_parent().get_node("Messages/WelcomeMessage").visible = false
					get_parent().get_node("Messages/WelcomeMessage2").visible = true
				if mt == e.SINK:
					get_parent().get_node("Messages/SinkMessage").visible = false
					get_parent().get_node("Messages/SinkMessage2").visible = true
				if mt == e.COGS:
					get_parent().get_node("MessageAnimation").play_backwards("IncomingMessage")
					ended = true
			else:
				get_parent().get_node("MessageAnimation").play_backwards("IncomingMessage")
				ended = true
