extends Button
class_name Discard_Button

func _ready() -> void:
	Globals.discard_button = self

func onPress() -> void:
	Globals.sound_manager.sfx_Discard.play()
	Globals.card_manager.draw_card()
	pass


func _on_mouse_entered() -> void:
	Globals.grid_manager.select_new_cell(null)
