extends Node

const INCREMENT_FACTOR: int = 10

@export var increment_delay: float = 0.02

@onready var life_energy_label: Label = $TotalLifeEnergy
@onready var life_energy_bar: TextureProgressBar = $AspectRatioContainer/life_energy_bar
@onready var timer: Timer = $Timer

var display_life_energy: int = 0

func _ready() -> void:
	Globals.life_energy_manager.update.connect(updateUI)
	updateUI()

func _process(delta: float) -> void:
	if display_life_energy < Globals.life_energy_manager.currentLifeEnergy and timer.is_stopped():
		timer.start(increment_delay)

## UPDATE THE PROGRESS BAR MAX ETC FROM NEW LEVEL
func updateUI() -> void:
	if Globals.life_energy_manager.currentLifeEnergy == 0:
		life_energy_label.text = "0"
		display_life_energy = 0
		timer.stop()
	life_energy_bar.value = Globals.life_energy_manager.currentLifeEnergy
	life_energy_bar.max_value = Globals.life_energy_manager.life_energy_max
	print("updated")


func _on_timer_timeout() -> void:
	display_life_energy += INCREMENT_FACTOR
	life_energy_label.text = str(display_life_energy)
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(life_energy_label, "scale", Vector2.ONE * 1.65, increment_delay/2)
	tween.tween_property(life_energy_label, "scale", Vector2.ONE, increment_delay/2)
