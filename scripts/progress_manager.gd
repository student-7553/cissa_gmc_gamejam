extends Node

@onready var life_energy_label: Label = $TotalLifeEnergy
@onready var life_energy_bar: TextureProgressBar = $AspectRatioContainer/life_energy_bar

func _ready() -> void:
	Globals.life_energy_manager.update.connect(updateUI)
	updateUI()

## UPDATE THE PROGRESS BAR MAX ETC FROM NEW LEVEL
func updateUI() -> void:
	life_energy_label.text = str(Globals.life_energy_manager.currentLifeEnergy)
	life_energy_bar.value = Globals.life_energy_manager.currentLifeEnergy
	life_energy_bar.max_value = Globals.life_energy_manager.life_energy_max
	print("updated")
