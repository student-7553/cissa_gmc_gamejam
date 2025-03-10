extends Control
class_name Current_Card
var cardManager: CardManager

@export var cardHolder: CardHolder
var currentCard: Card


func _ready() -> void:
	cardHolder = get_node("CardHolder")
	cardManager = get_node("../../CardManager")
	assert(cardManager != null, "CardManager is empty")

	cardManager.cardStackUpdate.connect(handleCardStackUpdate)

func handleCardStackUpdate() -> void:
	var topCard = cardManager.getTopCard()
	switch_CurrentCard(topCard)

func switch_CurrentCard(card: Card) -> void:
	cardHolder.clearCurrentCard()
	cardHolder.spawnNextCurrentCard(card)
