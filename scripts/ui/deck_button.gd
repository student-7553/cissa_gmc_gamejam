extends Button

signal toggleVisibility

func _on_deck_button_pressed() -> void:
	toggleVisibility.emit()
	# opens scrolling deck card
