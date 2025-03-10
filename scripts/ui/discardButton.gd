extends Button

var cardManager: CardManager
func _ready() -> void:
	if !cardManager:
		cardManager = get_node("../../../CardManager")
		assert(cardManager != null, "Card Manager is empty")
	pass


func onPress() -> void:
	cardManager.draw_card()
	pass


func _on_mouse_entered() -> void:
	Globals.grid_manager.select_new_cell(null)
