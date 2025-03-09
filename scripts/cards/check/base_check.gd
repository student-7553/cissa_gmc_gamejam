extends Node
class_name BaseCheck

## The list of cells that can be placed on top of this cell
@export var valid_cells: Array[Card.PossibleCell]

func valid_placement(type: Card.PossibleCell) -> bool:
	return type in valid_cells
