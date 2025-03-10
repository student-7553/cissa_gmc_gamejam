extends Node3D

class_name CardManager

signal cardStackUpdate

@export var possibleCards: Card_List

@export var defaultSpawnCard: int = 0

@export var cardStackCount: int = 10

@export var forcedEntries: Array[CardStackForceEntry]

var rng = RandomNumberGenerator.new()

var currentStackCards: Array[Card] = []

func _ready() -> void:
	handleStackCardInit()
	cardStackUpdate.emit()

func handleStackCardInit() -> void:
	for index in cardStackCount:
		var chosenIndex: int = rng.randi_range(0, possibleCards.cards.size() - 1)

		var randomFloat: float = rng.randf_range(0.0, 1.0)
		var percentageCounter = 0.0

		for entry in forcedEntries:
			if entry.forcedIndexStart <= index && entry.forcedIndexEnd > index:
				percentageCounter = percentageCounter + entry.forcedPercentage
				if percentageCounter > randomFloat:
					print()
					chosenIndex = possibleCards.cards.find_custom(func(card): return card.cellKey == entry.forcedCard)
					break
				pass

		currentStackCards.append(possibleCards.cards[chosenIndex])
	pass

func getTopCard() -> Card:
	if currentStackCards.size() == 0:
		push_error("currentStackCards size is 0")
		return null
	return currentStackCards[0]

func playCard() -> void:
	var poppedCard = currentStackCards.pop_front()
	cardStackUpdate.emit()
	pass
