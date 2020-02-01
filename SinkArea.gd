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
			var grid_pos = pixel_to_grid(pos.x, pos.y)
			print(grid_pos)
			if grid_pos != null:
				globals.target = grid_pos
			
func pixel_to_grid(x, y):
	var column = (x - globals.x_start) / globals.offset
	if column < 0 or column >= globals.width:
		return null
	column = int(column)
	var row = (y - globals.y_start) / globals.offset
	if row < 0 or row >= globals.height:
		return null
	row = int(row)
	var res = Vector2(column, row)
	return res
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
