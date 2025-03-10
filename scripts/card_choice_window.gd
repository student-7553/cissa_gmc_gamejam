extends PanelContainer
class_name Card_Choice_Window

@export var card_choice_scene: PackedScene

@onready var choice_box: HBoxContainer = $MarginContainer/VBoxContainer/choice_box

signal left_over_card(card: Card)

func _ready() -> void:
	Globals.card_choice_window = self

func present_choices(cards: Array[Card]):
	if cards.size() == 0:
		return
	# clear the previous choices
	for child in choice_box.get_children():
		child.queue_free()
	# populate the new card choices
	for card in cards:
		var card_choice: Card_Choice = card_choice_scene.instantiate()
		choice_box.add_child(card_choice)
		card_choice.insert_card(card)
		card_choice.chose_card.connect(select_card)
	Globals.discard_button.hide()
	show()

func select_card(card: Card):
	Globals.card_manager.add_card_to_roulette(card)
	Globals.card_manager.draw_card()
	Globals.discard_button.show()
	hide()
