extends Synergy
class_name Arctic_Synergy

func attempt_synergy_adj(type: Card.PossibleCell):
	if type == Card.PossibleCell.CAMP:
		increase_score.emit(100)
