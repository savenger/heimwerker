extends Area2D

var globals = null

# Called when the node enters the scene tree for the first time.
func _ready():
	globals = get_parent().globals
	pass # Replace with function body.

# set target if no pipe is clicked
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		print("Sink:_input_event")
		if event.button_index == BUTTON_LEFT:
			var pos = get_global_mouse_position()
			print("pos")
			print(pos)
			globals.target = pixel_to_grid(pos.x, pos.y)
			
func pixel_to_grid(x, y):
	var column = int((x - globals.x_start) / globals.offset)
	var row = int((y - globals.y_start) / globals.offset)
	var res = Vector2(column, row)
	print("pixel_to_grid")
	print(x, " ", y)
	print(res)
	return res
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
