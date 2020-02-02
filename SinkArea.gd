extends Area2D

var sink_defs = null
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sink_defs = get_parent().sink_defs
	reset()
	
func reset():
	finished = false

func check_success():
	var success = true
	for child in get_parent().get_children():
		if child.name.substr(0,4) == "Pipe":
			print(child.name)
			for p in sink_defs.pipe_defs:
				var name = p[0]
				var count = p[1]
				var trans = p[2]
				for i in count:
					if name + str(i) == child.name:
						print(name)
						if name == "Pipe_U_Short":
							pass
						var n = child.get_node("Area2D")
						print("rot: ", n.rotation_degrees)
						if not fmod(int(n.rotation_degrees), 360) == trans[i][2]:
							print(child.name, " not in ", trans[i][2], " insted: ", fmod(int(n.rotation_degrees), 360))
							return false
						print("posx: ", n.global_position.x)
						print("posy: ", n.global_position.y)
						if n.global_position.x != trans[i][0] or n.global_position.y != trans[i][1]:
							print(sink_defs.selected)
							var target = sink_defs.target
							var grd = pixel_to_grid(trans[i][0], trans[i][1])
							if target:
								if not (n == sink_defs.selected and (target.x == grd.x and target.y == grd.y)):
									print(child.name, " X: ", n.global_position.x, " and should be ", trans[i][0])
									print(child.name, " Y: ", n.global_position.y, " and should be ", trans[i][1])
									return false
							else:
								return false
	# trigger success if every pipe is in correct order
	print("success?")
	if success and not finished:
		for child in get_parent().get_children():
			if child.name.substr(0,4) == "Pipe":
				child.get_node("Area2D").finished = true
		finished = true
		print("finished !!!!")
		var anim = get_parent().get_node("AnimationPlayer")
		if(not anim.is_playing()):
			anim.play("Success_Animation")
		return true

# set target if no pipe is clicked
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.is_pressed():
		print("Sink:_input_event")
		if event.button_index == BUTTON_RIGHT:
			check_success()
		if event.button_index == BUTTON_LEFT:
			if finished:
				return
			var pos = get_global_mouse_position()
			var grid_pos = pixel_to_grid(pos.x, pos.y)
			if grid_pos != null:
				sink_defs.target = grid_pos
			check_success()
	elif event is InputEventScreenTouch:
		if finished:
			return
		var pos = event.position
		var grid_pos = pixel_to_grid(pos.x, pos.y)
		if grid_pos != null:
			sink_defs.target = grid_pos
		check_success()
			
func pixel_to_grid(x, y):
	var column = (x - sink_defs.x_start) / sink_defs.offset
	if column < 0 or column >= sink_defs.width:
		return null
	column = int(column)
	var row = (y - sink_defs.y_start) / sink_defs.offset
	if row < 0 or row >= sink_defs.height:
		return null
	row = int(row)
	var res = Vector2(column, row)
	return res

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
