extends Area2D

# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input_event(_viewport, event, _shape_idx):
	# print(viewport, shape_idx)
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	# print("res://scenes/"+self.name+".tscn")
	get_tree().change_scene("res://"+self.name+".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
