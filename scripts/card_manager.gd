extends Node3D

class_name CardManager

signal cardStackUpdate

@export var possibleCards: Array[Card]

@export var defaultSpawnCard: int = 0

@export var cardStackCount: int = 10

var rng = RandomNumberGenerator.new()

var currentStackCards: Array[Card] = []

func _ready() -> void:
	currentStackCards.resize(cardStackCount);

	var my_random_number: int = rng.randi_range(0, possibleCards.size() - 1)

	for cardIndex in cardStackCount:
		currentStackCards[cardIndex] = possibleCards[my_random_number]
	
	cardStackUpdate.emit()

	pass

func getTopCard() -> Card:
	if currentStackCards.size() == 0:
		push_error("currentStackCards size is 0")
	return currentStackCards[0]

func playCard() -> void:
	var poppedCard = currentStackCards.pop_front()
	cardStackUpdate.emit()
	pass
