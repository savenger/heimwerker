extends Area2D

export (int) var speed = 950

var target = Vector2()
var velocity = Vector2()

func _ready():
	print("----")
	print(target)
	print(global_position)
	target = global_position
	print("####")
	print(target)
	print(global_position)
	print("----")

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		if event.button_index == BUTTON_RIGHT:
			rotate(PI/2.0)
		if event.button_index == BUTTON_LEFT:
			get_parent().globals.selected = self

func _input(event):
	if get_parent().globals.selected == self:
		if event.is_action_pressed('click'):
			target = get_global_mouse_position()

func _physics_process(delta):
	velocity = global_position.direction_to(target) * speed
	# look_at(target)
	if global_position.distance_to(target) > 10:
		global_position += velocity * delta
