extends BaseCheck

@export var allowedPlaces: Array[Card.PossibleCell] = [Card.PossibleCell.LAVA]

func checkIfValidToPlace(nextCard: Card) -> bool:
	if !allowedPlaces.has(nextCard.cellKey):
		return true

	return false
