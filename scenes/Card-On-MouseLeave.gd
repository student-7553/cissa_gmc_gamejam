extends Control

class_name CardHolder
#slides the card down if the player's mouse leaves the card
@export var Card_Holder: Control

var save_pos: Vector2

var spawnedCurrentCard: TextureRect
var cardManager: CardManager

func _ready() -> void:
	save_pos = position


func clearCurrentCard() -> void:
	if spawnedCurrentCard != null:
		spawnedCurrentCard.queue_free()
	pass

func spawnNextCurrentCard(card: Card) -> void:
	var cardSpriteNode = card.cardSpriteScene.instantiate()
	add_child(cardSpriteNode)
	pass

func _on_control_mouse_exited() -> void:
	Globals.sound_manager.sfx_LowerCard.play()
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 300, 0.5)
	#print("mouse exited")

func _on_mouse_entered() -> void:
	Globals.sound_manager.sfx_ViewCard.play()
	#print("mouse reentered")
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25)
	#tw.tween_callback(find_neighbours)
