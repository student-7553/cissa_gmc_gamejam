extends Control
class_name Current_Card

@onready var cardHolder: CardHolder = $CardHolder
var currentCard: Card

func _ready() -> void:
	Globals.card_manager.drawn_card.connect(handleCardStackUpdate)

func handleCardStackUpdate() -> void:
	var topCard = Globals.card_manager.current_card
	if topCard == null:
		return
	switch_CurrentCard(topCard)

func switch_CurrentCard(card: Card) -> void:
	cardHolder.clearCurrentCard()
	cardHolder.spawnNextCurrentCard(card)
