extends Node
class_name Synergy

const HEX_DIRECTIONS: Array[Vector3] = [Vector3(1, 0, -1), Vector3(1, -1, 0), Vector3(0, -1, 1), Vector3(-1, 0, 1), Vector3(-1, 1, 0), Vector3(0, 1, -1)]

signal increase_score(point: int)
signal replace_self(card: Card)

var type: Card.PossibleCell

## Override Methods
# takes in array of hex cell and override logic will loop through looking for a certain and perform something
# called in the grid_manager
func scan_neighbours(neighbours: Array[Hex_Cell]):
	for cell: Hex_Cell in neighbours:
		cell.synergy.attempt_synergy_adj(type)

## Called when replacing a cell e.g. ocean turns lava into ground
func attempt_synergy_self(prev_type: Card.PossibleCell):
	pass

# another cell will try to call this function. if the synergy is the right type then call this function
func attempt_synergy_adj(adj_type: Card.PossibleCell):
	pass

func get_neighbours(pos: Vector3, grid: Hex_Grid) -> Array[Hex_Cell]:
	var hex_array: Array[Hex_Cell] = []
	for hex_dir in HEX_DIRECTIONS:
		var adj_pos: Vector3 = hex_dir + pos
		if adj_pos in grid.grid.keys():
			hex_array.append(grid.grid[hex_dir + pos])
	return hex_array