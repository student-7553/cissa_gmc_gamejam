extends HBoxContainer


var cardManager: CardManager

func _ready() -> void:
	if !cardManager:
		cardManager = get_node("../../../../CardManager")
		cardManager.cardStackUpdate.connect(handleCardStackUpdate)
	pass

func handleCardStackUpdate() -> void:
	for card in cardManager.currentStackCards:
		var newSpriteNode = card.cardSpriteScene.instantiate()
		add_child(newSpriteNode)
	pass
