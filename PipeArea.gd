extends Area2D

export (int) var speed = 950

var velocity = Vector2()

func _ready():
	print("----")
	print(get_parent().globals.target)
	print(global_position)
	# target = global_position
	print("####")
	print(get_parent().globals.target)
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


func _physics_process(delta):
	if get_parent().globals.target and get_parent().globals.selected == self:
		velocity = global_position.direction_to(get_parent().globals.target) * speed
		if global_position.distance_to(get_parent().globals.target) > 10:
			global_position += velocity * delta
