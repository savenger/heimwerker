extends Area2D

export (int) var speed = 900

var velocity = Vector2()
var globals = null

func _ready():
	globals = get_parent().globals
	print("----")
	print(globals.target)
	print(global_position)
	# target = global_position
	print("####")
	print(globals.target)
	print(global_position)
	print("----")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		print("PipeArea:_input_event")
		if event.button_index == BUTTON_RIGHT:
			rotate(PI/2.0)
		if event.button_index == BUTTON_LEFT:
			get_parent().globals.selected = self

func grid_to_pixel(column, row):
	var x = globals.x_start + globals.offset * column + globals.offset / 2
	var y = globals.y_start + globals.offset * row + globals.offset / 2
	return Vector2(x, y)

func _physics_process(delta):
	if globals.target != null and globals.selected == self:
		var target = grid_to_pixel(globals.target.x, globals.target.y)
		velocity = global_position.direction_to(target) * speed
		if global_position.distance_to(target) > 10:
			global_position += velocity * delta
		else:
			global_position = target
