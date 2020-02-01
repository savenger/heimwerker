extends Area2D

# Declare member variables here. 
var selected = null
var target = null
var width = 9
var height = 8
var x_start = 500
var y_start = 200
var offset = 100
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		if event.button_index == BUTTON_LEFT:
			var pos = get_global_mouse_position()
			print("pos "+str(pos))
#			var grid_pos = pixel_to_grid(pos.x, pos.y)
#			print("grid_pos "+str(grid_pos))
			if pos != null:
				target = pos
			
#func pixel_to_grid(x, y):
#	var column = (x - x_start) / offset
#	if column < 0 or column >= width:
#		return null
#	column = int(column)
#	var row = (y - y_start) / offset
#	if row < 0 or row >= height:
#		return null
#	row = int(row)
#	var res = Vector2(column, row)
#	return res

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
