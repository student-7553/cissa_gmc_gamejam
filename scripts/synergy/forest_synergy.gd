extends Synergy
class_name Forest_Synergy


# another cell will try to call this function. if the synergy is the right type then call this function
func attempt_synergy_adj(type: Card.PossibleCell):
	# Add 1 if mountain is placed next to this forest
	if type == Card.PossibleCell.MOUNTAIN || type == Card.PossibleCell.CAMP:
		increase_score.emit(100)

func attempt_synergy_self(prev_type: Card.PossibleCell):
	increase_score.emit(100)
