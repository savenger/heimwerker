extends Area2D

export (int) var speed = 200

func _ready():
	# self.connect("input_event", self, "_on_input_event")
	pass

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		if event.button_index == BUTTON_RIGHT:
			rotate(PI/2.0)
		if event.button_index == BUTTON_LEFT:
			get_parent().selected = self
			get_parent().target = null
			print("self "+self.name)

#func grid_to_pixel(column, row):
#	var x = get_parent().x_start + get_parent().offset * column + get_parent().offset / 2
#	var y = get_parent().y_start + get_parent().offset * row + get_parent().offset / 2
#	return Vector2(x, y)

func _physics_process(delta):
	# print("target "+str(get_parent().target))
	print(get_parent().target)
	if get_parent().target != null and get_parent().selected == self:
		# var globals.target = grid_to_pixel(globals.target.x, globals.target.y)
		get_parent().velocity = global_position.direction_to(get_parent().target) * speed
		if global_position.distance_to(get_parent().target) > 10:
			global_position += get_parent().velocity * delta
		else:
			global_position = get_parent().target
