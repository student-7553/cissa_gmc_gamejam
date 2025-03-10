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
