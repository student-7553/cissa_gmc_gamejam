extends AspectRatioContainer
class_name Card_Choice

@onready var button: Button = $Button

signal chose_card(card: Card)

var card_value: Card

func _ready() -> void:
	$card.queue_free()
	pass

func insert_card(card: Card):
	card_value = card
	var card_sprite: TextureRect = card.cardSpriteScene.instantiate()
	add_child(card_sprite)
	move_child(button, -1)


func _on_button_pressed() -> void:
	chose_card.emit(card_value)
