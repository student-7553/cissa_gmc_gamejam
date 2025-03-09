extends Node
class_name Synergy

## Override Methods
# takes in array of hex cell and override logic will loop through looking for a certain and perform something
# called in the grid_manager
func scan_neighbours(neighbours: Array[Hex_Cell]):
	for cell in neighbours:
		attempt_synergy(cell)

# another cell will try to call this function. if the synergy is the right type then call this function
func attempt_synergy(cell: Hex_Cell):
	pass
