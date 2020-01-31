extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_RIGHT \
	and event.is_pressed():
		rotate(PI/2.0)
