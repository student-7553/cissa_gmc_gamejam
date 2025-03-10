extends Node
class_name Level_Manager

@export var levels: Array[Level]

var left_over_card: Card # Card left over from previous level
var cur_level: int = -1

func win_condition():
	return cur_level >= levels.size()

func present_choices():
	Globals.card_choice_window.present_choices(levels[cur_level].card_choices)

func current_level()->Level:
	return levels[cur_level]

func next_level():
	cur_level += 1
