extends Synergy
class_name Arctic_Synergy

# another cell will try to call this function. if the synergy is the right type then call this function
func attempt_synergy(adj_cell: Hex_Cell):
	## Give every adj Ocean +1
	if adj_cell.card.cellKey == Card.PossibleCell.OCEAN:
		adj_cell.current_score += 1
		

func _init() -> void:
#   communicate the with ethe grid to find all the required points for 
#	
	#parent hexcell and if required also its adj hexcell
	
	pass
