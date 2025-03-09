extends BaseCheck

@export var allowedPlaces: Array[Card.PossibleCell] = [Card.PossibleCell.OCEAN, Card.PossibleCell.MOUNTAIN, Card.PossibleCell.FOREST, Card.PossibleCell.BEACH, Card.PossibleCell.LAVA]

func checkIfValidToPlace(nextCard: Card) -> bool:
	if !allowedPlaces.has(nextCard.cellKey):
		return true

	return false
