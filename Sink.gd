extends Node2D

class SinkDefs:
	var selected = null
	var target = null
	var width = 9
	var height = 8
	var x_start = 500
	var y_start = 200
	var offset = 100
	var pipes = []
	var pipe_defs = [
		["Pipe_T", 2, [[1350, 850, 180], [550, 350, 0]]],
		["Pipe_I", 1, [[850, 350, 90]]],
		["Pipe_L", 1, [[1050, 850, 180]]],
		["Pipe_End", 2, [[1350, 550, 0], [1150, 350, 90]]],
		["Pipe_U_Long", 1, [[650, 650, 0]]],
		["Pipe_U_Short", 1, [[950, 450, 180]]]
	]
	
	func grid_to_pixel(column, row):
		var x = x_start + offset * column + offset / 2
		var y = y_start + offset * row + offset / 2
		return Vector2(x, y)

var sink_defs = SinkDefs.new()
var holes = []

func init_level(extra):
	$AnimationPlayer.seek(0, true)
	$SinkArea.reset()
	sink_defs.pipes = []
	sink_defs.selected = null
	sink_defs.target = null
	# load some pipes
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var j = 0
	for child in get_children():
		if child.name.substr(0, 4) == "Pipe":
			print("freeing ", child.name)
			child.free()
	for pipe in sink_defs.pipe_defs:
		var name = pipe[0]
		var count = pipe[1]
		var trans = pipe[2]
		var p = load("res://" + name + ".tscn")
		for i in count:
			var node = p.instance()
			var pos = Vector2(trans[i][0], trans[i][1])
			node.name = name + str(i)
			print(node.name)
			if extra:
				pos = sink_defs.grid_to_pixel(rng.randi_range(0, sink_defs.width - 1), rng.randi_range(0, sink_defs.height - 1))
			node.set_position(pos)
			node.sink_defs = sink_defs
			add_child(node, true)
			sink_defs.pipes.append(node)
			j += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	# set area2d size to capture input
	var screensize = get_viewport().get_visible_rect().size
	$SinkArea/CollisionShape2D.position = Vector2(screensize.x / 2, screensize.y / 2)
	$SinkArea/CollisionShape2D.scale = Vector2(screensize.x, screensize.y)
	init_level(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
