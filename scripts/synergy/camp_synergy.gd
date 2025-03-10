extends Synergy

@export var globalTargetNodes: Array[Card.PossibleCell] = []


func get_neighbours(pos: Vector3, grid: Hex_Grid) -> Array[Hex_Cell]:
	var hex_array: Array[Hex_Cell] = []
	for hexCell in grid.grid.values():
		if hexCell.cell_type in globalTargetNodes:
			hex_array.append(hexCell)
	return hex_array

func scan_neighbours(neighbours: Array[Hex_Cell]):
	for cell: Hex_Cell in neighbours:
		cell.synergy.attempt_synergy_adj(Card.PossibleCell.CAMP)
