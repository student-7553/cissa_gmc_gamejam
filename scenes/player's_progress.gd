extends ProgressBar

#copied from bill's total life energy code,
# updates the value variable of the progress bar
var lifeEnergyManager: LifeEnergyManager

func updateUI() -> void:
	value = int(lifeEnergyManager.currentLifeEnergy)
	pass

func _ready() -> void:
	if lifeEnergyManager:
		lifeEnergyManager = get_node("../../LifeEnergyManager")
		lifeEnergyManager.update.connect(updateUI)
		updateUI()
	pass
