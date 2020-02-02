extends Area2D

# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input_event(_viewport, event, _shape_idx):
	var img = get_parent().get_node("ActionImage")
	# print(viewport, shape_idx)
	if event is InputEventMouseMotion:
		if img:
			img.visible = true
			img.position = self.position
	if event is InputEventMouseButton:
		# set_default_cursor_shape(Control.CURSOR_POINTING_HAND)
		if event.button_index == BUTTON_LEFT \
		and event.is_pressed():
			self.on_click()

func on_click():
	# print("res://scenes/"+self.name+".tscn")
	get_tree().change_scene("res://"+self.name+".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_mouse_exited():
	var img = get_parent().get_node("ActionImage")
	if img:
		img.visible = false
