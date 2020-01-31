extends Area2D

# Declare member variables here. Examples:
onready var called_by = self.name
# onready var called_by = get_parent().name
# onready var called_by2 = get_owner().get_child(1).name

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input_event(viewport, event, shape_idx):
	# print(viewport, shape_idx)
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	# print(called_by1)
	print("res://scenes/"+called_by+".tscn")
	# get_node("/root/globals").setScene("res://scenes/"+called_by+".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
