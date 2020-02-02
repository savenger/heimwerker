extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		# start extra level
		get_parent().get_parent().init_level(false)
