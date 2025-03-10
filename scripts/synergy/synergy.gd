extends Node
class_name Synergy

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
