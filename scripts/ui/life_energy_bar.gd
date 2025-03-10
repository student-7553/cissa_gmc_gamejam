extends ProgressBar

#copied from bill's total life energy code,
# updates the value variable of the progress bar
func updateUI() -> void:
	value = int(Globals.life_energy_manager.currentLifeEnergy)
	print("updated")

func _ready() -> void:
	Globals.life_energy_manager.update.connect(updateUI)
	updateUI()
