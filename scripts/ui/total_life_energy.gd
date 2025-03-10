extends Label


var lifeEnergyManager: LifeEnergyManager

func updateUI() -> void:
	text = str(lifeEnergyManager.currentLifeEnergy)
	pass

func _ready() -> void:
	if !lifeEnergyManager:
		lifeEnergyManager = get_node("../../../LifeEnergyManager")
		print(lifeEnergyManager)
	
		lifeEnergyManager.update.connect(updateUI)
		updateUI()
	pass
