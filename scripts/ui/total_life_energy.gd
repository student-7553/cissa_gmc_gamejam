extends Label

func updateUI() -> void:
	text = str(Globals.life_energy_manager.currentLifeEnergy)
	print(Globals.life_energy_manager.currentLifeEnergy)
	print(text)

func _ready() -> void:
	Globals.life_energy_manager.update.connect(updateUI)
	updateUI()
