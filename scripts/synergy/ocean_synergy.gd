extends Synergy
class_name Ocean_Synergy

@export var ground_card: Card

# another cell will try to call this function. if the synergy is the right type then call this function
func attempt_synergy_adj(adj_type: Card.PossibleCell):
	if adj_type == Card.PossibleCell.ARCTIC or adj_type == Card.PossibleCell.BEACH:
		increase_score.emit(100)

func attempt_synergy_self(prev_type: Card.PossibleCell):
	if prev_type == Card.PossibleCell.LAVA:
		# replace self with ground
		replace_self.emit(ground_card)
	else:
		increase_score.emit(100)
