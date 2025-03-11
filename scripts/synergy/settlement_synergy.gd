extends Synergy

func attempt_synergy_self(prev_type: Card.PossibleCell):
	for cell: Hex_Cell in Globals.grid_manager.grid.grid.values():
		if cell.cell_type != Card.PossibleCell.GROUND:
			cell.increase_score(20)
