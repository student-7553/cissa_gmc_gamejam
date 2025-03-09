extends Node3D

class_name CardManager

signal cardStackUpdate

@export var possibleCards: Array[Card]

@export var cardStackCount: int = 10

var currentStackCards: Array[Card] = []

func _ready() -> void:
	currentStackCards.resize(cardStackCount);

	# Todo figure out a random number
	var randomNumber = 0

	for cardIndex in cardStackCount:
		currentStackCards[cardIndex] = possibleCards[randomNumber]
	
	cardStackUpdate.emit()

	pass


func playCard() -> void:
	var poppedCard = currentStackCards.pop_front()
	cardStackUpdate.emit()

	# Todo Spawn the node on the field
	pass
