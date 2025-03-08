extends Label


var lifeEnergyManager: LifeEnergyManager

func updateUI() -> void:
	text = str(lifeEnergyManager.currentLifeEnergy)
	pass

func _ready() -> void:
	lifeEnergyManager = get_node("../../LifeEnergyManager")
	lifeEnergyManager.update.connect(updateUI)
	updateUI()
	pass