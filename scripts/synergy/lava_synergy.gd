extends Synergy
class_name Lava_Synergy

@export var ground_card: Card

func attempt_synergy_self(prev_type: Card.PossibleCell):
	if prev_type == Card.PossibleCell.OCEAN:
		# replace self with ground
		replace_self.emit(ground_card)
