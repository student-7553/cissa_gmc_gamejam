extends Label

func updateUI() -> void:
	text = str(Globals.card_manager.remaining_cards())
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "scale", Vector2.ONE * 1.25, 0.1)
	tw.tween_property(self, "scale", Vector2.ONE, 0.1)

func _ready() -> void:
	Globals.card_manager.drawn_card.connect(updateUI)
	updateUI()
