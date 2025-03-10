extends Label

func updateUI() -> void:
	text = str(Globals.card_manager.remaining_cards())
	pass

func _ready() -> void:
	Globals.card_manager.drawn_card.connect(updateUI)
	updateUI()
