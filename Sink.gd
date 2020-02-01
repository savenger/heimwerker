extends Node2D

class Globals:
	var selected = null
	var target = null

var active_inv_item = null
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
	$Area2D/CollisionShape2D.position = Vector2(screensize.x / 2, screensize.y / 2)
	$Area2D/CollisionShape2D.scale = Vector2(screensize.x, screensize.y)
	
	# load some pipes
	var Pipe = load("res://Pipe.tscn")
	var inventory = [1,2,3,4,5]
	for i in inventory:
		var node = Pipe.instance()
		node.position.x = 150 * i
		node.position.y = 400
		node.globals = globals
		add_child(node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
