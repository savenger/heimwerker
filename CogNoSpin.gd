extends RigidBody2D

# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# self.set_angular_velocity(2)
	# self.set_linear_velocity(Vector2(0,0))

func _integrate_forces(state):
	var _vel = state.get_linear_velocity ()
	state.set_linear_velocity (Vector2 (0, 0))
