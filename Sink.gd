extends Node2D

class SinkDefs:
	var selected = null
	var target = null
	var width = 14
	var height = 14
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

var sink_defs = SinkDefs.new()
var holes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# set area2d size to capture input
	var screensize = get_viewport().get_visible_rect().size
	$SinkArea/CollisionShape2D.position = Vector2(screensize.x / 2, screensize.y / 2)
	$SinkArea/CollisionShape2D.scale = Vector2(screensize.x, screensize.y)
	
	# load some pipes
	var j = 0
	for pipe in sink_defs.pipe_defs:
		var name = pipe[0]
		var count = pipe[1]
		var trans = pipe[2]
		var p = load("res://" + name + ".tscn")
		for i in count:
			var node = p.instance()
			node.name = name + str(i)
			print(node.name)
			node.set_position(Vector2(trans[i][0], trans[i][1]))
			node.sink_defs = sink_defs
			add_child(node, true)
			sink_defs.pipes.append(node)
			j += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
