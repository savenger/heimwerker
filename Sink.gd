extends Node2D

class Globals:
	var selected = null
	var target = null
	var width = 14
	var height = 14
	var x_start = 500
	var y_start = 200
	var offset = 100

var globals = Globals.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#func _unhandled_input(event):
#	if get_parent().globals.selected == self:
#		if event.is_action_pressed('click'):
#			print("_input")
#			target = get_global_mouse_position()

# Called when the node enters the scene tree for the first time.
func _ready():
	# set area2d size to capture input
	var screensize = get_viewport().get_visible_rect().size
	$SinkArea/CollisionShape2D.position = Vector2(screensize.x / 2, screensize.y / 2)
	$SinkArea/CollisionShape2D.scale = Vector2(screensize.x, screensize.y)
	
	# load some pipes
	var pipes = [
		["Pipe_T", 2, [[1350, 850], [550, 350]]],
		["Pipe_I", 1, [[850, 350]]],
		["Pipe_L", 1, [[1050, 850]]],
		["Pipe_End", 2, [[1350, 550], [1150, 350]]],
		["Pipe_U1", 1, [[650, 650]]],
		["Pipe_U2", 1, [[950, 450]]]
	]
	var j = 0
	for pipe in pipes:
		var name = pipe[0]
		var count = pipe[1]
		var pos = pipe[2]
		var p = load("res://" + name + ".tscn")
		for i in count:
			var node = p.instance()
			node.name = name + str(i)
			node.position.x = pos[i][0]
			node.position.y = pos[i][1]
			node.globals = globals
			add_child(node)
			j += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
