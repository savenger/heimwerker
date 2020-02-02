extends Area2D

export (int) var speed = 900
export (int) var cur_rot = rotation_degrees

var velocity = Vector2()
var sink_defs = null
var finished = false

func _ready():
	sink_defs = get_parent().sink_defs

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		if finished:
			return
		print("PipeArea:_input_event")
		if event.button_index == BUTTON_RIGHT:
			rotate(PI/2.0)
			sink_defs.selected = self
			sink_defs.target = null
		if event.button_index == BUTTON_LEFT:
			sink_defs.selected = self
			sink_defs.target = null
	if event is InputEventScreenTouch:
		if finished:
			return
		rotate(PI/2.0)
		sink_defs.selected = self
		sink_defs.target = null

func _physics_process(delta):
	if not sink_defs:
		return
	if sink_defs.target != null and sink_defs.selected == self:
		var target = sink_defs.grid_to_pixel(sink_defs.target.x, sink_defs.target.y)
		velocity = global_position.direction_to(target) * speed
		if global_position.distance_to(target) > 10:
			global_position += velocity * delta
		else:
			global_position = target
