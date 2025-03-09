extends Control

#slides the card down if the player's mouse leaves the card
@export var Card_Holder: Control

var save_pos: Vector2

func _ready() -> void:
	save_pos = position

func _on_control_mouse_exited() -> void:
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 300, 0.5)
	print("mouse exited")

func _on_mouse_entered() -> void:
	print("mouse reentered")
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25)
	#tw.tween_callback(find_neighbours)
