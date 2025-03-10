extends Button

signal toggleVisibility

func _on_deck_button_pressed() -> void:
	print("deck button pressed")
	toggleVisibility.emit()
	# opens scrolling deck card
