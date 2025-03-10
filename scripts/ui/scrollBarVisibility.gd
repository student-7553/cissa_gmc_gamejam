extends CanvasLayer


var isVisibile: bool = false


func _on_button_2_toggle_visibility() -> void:
	isVisibile = !isVisibile
	if isVisibile:
		visible = true
	else:
		visible = false
	pass
