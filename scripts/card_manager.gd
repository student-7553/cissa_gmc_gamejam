extends Node3D

class_name CardManager

@export var deck_size: int = 58

var card_roulette: Array[Card] = [] # [ocean, ocean, ocean, lava, arctic, arctic]
var card_collection: Array[Card] # collection of possible cards - [ocean, lava, arctic]
var rng = RandomNumberGenerator.new()
var count: int = 0
var current_card: Card

signal drawn_card
signal chosen_card(card: Card)

func _ready() -> void:
	Globals.card_manager = self

## Get a new random card
func draw_card():
	var spin_index: int = rng.randi_range(0, card_roulette.size() - 1)
	count += 1
	current_card = card_roulette[spin_index]
	drawn_card.emit()

func add_card_to_roulette(card: Card):
	chosen_card.emit(card)
	for entry in range(card.roulette_entries):
		card_roulette.append(card)
	card_collection.append(card)

func remaining_cards() -> int:
	return deck_size - count

func lose_condition():
	return count > deck_size
