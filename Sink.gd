extends Node2D

class Globals:
	var selected = null

var active_inv_item = null
var globals = Globals.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
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
