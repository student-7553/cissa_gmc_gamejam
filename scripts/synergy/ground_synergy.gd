extends Synergy
class_name Ground_Synergy

func attempt_synergy_adj(adj_type: Card.PossibleCell):
	if adj_type == Card.PossibleCell.BEACH:
		increase_score.emit(100)
