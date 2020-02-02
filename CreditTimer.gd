extends Timer



func _on_CreditTimer_timeout():
	get_parent().get_node("Credits1").visible = false
	get_parent().get_node("Credits2").visible = true
