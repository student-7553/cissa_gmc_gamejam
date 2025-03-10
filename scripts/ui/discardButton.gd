extends Button

var cardManager: CardManager
func _ready() -> void:
	if !cardManager:
		cardManager = get_node("../../../CardManager")
		assert(cardManager != null, "Card Manager is empty")
	pass


func onPress() -> void:
	cardManager.playCard()
	pass


func _on_button_pressed() -> void:
	pass # Replace with function body.
