extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# set target if no pipe is clicked
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		print("Sink:_input_event")
		if event.button_index == BUTTON_LEFT:
			get_parent().globals.target = get_global_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
