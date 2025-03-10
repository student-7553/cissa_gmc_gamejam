extends Node

@onready var life_energy_label: Label = $TotalLifeEnergy
@onready var life_energy_bar: TextureProgressBar = $AspectRatioContainer/life_energy_bar

func _ready() -> void:
	Globals.life_energy_manager.update.connect(updateUI)
	updateUI()

func updateUI() -> void:
	life_energy_label.text = str(Globals.life_energy_manager.currentLifeEnergy)
	life_energy_bar.value = int(Globals.life_energy_manager.currentLifeEnergy)
	print("updated")
