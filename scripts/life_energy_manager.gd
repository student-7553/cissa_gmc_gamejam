extends Node3D

class_name LifeEnergyManager

signal update
signal increment_level

@export var currentLifeEnergy: int = 0 ## reset each level

var life_energy_max: int ## changed each level

func _ready() -> void:
	Globals.life_energy_manager = self

func set_level(level: Level):
	currentLifeEnergy = 0
	life_energy_max = level.life_energy_max
	update.emit()

func check_level():
	if currentLifeEnergy >= life_energy_max:
		increment_level.emit()

func relativeUpdateLifeEnergy(point: int) -> void:
	currentLifeEnergy = currentLifeEnergy + point
	check_level()
	update.emit()

func updatedLifeEnergy(_currentLifeEnergy: int) -> void:
	currentLifeEnergy = _currentLifeEnergy
	check_level()
	update.emit()
