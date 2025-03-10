extends Node
class_name Level_Manager

@export var levels: Array[Level]

var left_over_card: Card # Card left over from previous level
var cur_level: int = -1

func _ready() -> void:
	Globals.card_manager.chosen_card.connect(set_left_over_card)

func win_condition():
	return cur_level >= levels.size()

func present_choices():
	var choices: Array[Card] = levels[cur_level].card_choices
	if left_over_card:
		choices.append(left_over_card)
	Globals.card_choice_window.present_choices(choices)

func current_level()->Level:
	return levels[cur_level]

func next_level():
	cur_level += 1

func set_left_over_card(chosen_card: Card):
	for card_choice in current_level().card_choices:
		if card_choice != chosen_card:
			left_over_card = card_choice
