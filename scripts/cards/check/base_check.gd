extends Node
class_name BaseCheck

## The list of cells that can be placed on top of this cell
@export var valid_cells: Array[Card.PossibleCell]

func valid_placement(nextCard: Card) -> bool:
	return nextCard.cellKey in valid_cells
