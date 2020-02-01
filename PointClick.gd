extends KinematicBody2D

export (int) var speed = 200

var target = Vector2()
var velocity = Vector2()

#func _input_event(viewport, event, shape_idx):
#	# print(viewport, shape_idx)
#	if event is InputEventMouseButton \
#	and event.button_index == BUTTON_LEFT \
#	and event.is_pressed():
#		self.on_click()
#
#func on_click():
#	pass
	
func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = (target - position).normalized() * speed
	# rotation = velocity.angle()
	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
