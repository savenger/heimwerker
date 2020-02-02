extends Node2D
enum FELIX_MESSAGE_TYPE {WELCOME, SINK, COGS}
export (FELIX_MESSAGE_TYPE) var message_type = FELIX_MESSAGE_TYPE.WELCOME

func _ready():
	var node = null
	if message_type == FELIX_MESSAGE_TYPE.WELCOME:
		node = "WelcomeMessage"
	elif message_type == FELIX_MESSAGE_TYPE.SINK:
		node = "SinkMessage"
	elif message_type == FELIX_MESSAGE_TYPE.COGS:
		node = "CogsMessage"
	get_node("Message/Messages/" + node).visible = true
	$Message/MessageAnimation.seek(0)
	$Message/MessageAnimation.play("IncomingMessage")
