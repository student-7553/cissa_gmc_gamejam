extends Label

var cardManager: CardManager

func updateUI() -> void:
	text = str(cardManager.currentStackCards.size())
	pass

func _ready() -> void:
	if cardManager:
		cardManager = get_node("../../CardManager")
		cardManager.cardStackUpdate.connect(updateUI)
		updateUI()
	pass
