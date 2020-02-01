extends Node2D

export (int) var width = 8
export (int) var height = 9
export (int) var x_start = 500
export (int) var y_start = 200
export (int) var offset = 100


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func grid_to_pixel(column, row):
	var x = x_start + offset * column
	var y = y_start + offset * row
	return Vector2(x, y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
