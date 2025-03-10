extends Label


var lifeEnergyManager: LifeEnergyManager

func updateUI() -> void:
	text = str(lifeEnergyManager.currentLifeEnergy)
	print(lifeEnergyManager.currentLifeEnergy)
	print(text)
	pass

func _ready() -> void:
	if !lifeEnergyManager:
		lifeEnergyManager = get_node("../../../LifeEnergyManager")
	
		lifeEnergyManager.update.connect(updateUI)
		updateUI()
	pass
