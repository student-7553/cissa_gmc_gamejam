extends Node3D

class_name LifeEnergyManager

signal update

@export var currentLifeEnergy: int = 0

func _ready() -> void:
	Globals.life_energy_manager = self

func relativeUpdateLifeEnergy(point: int) -> void:
	currentLifeEnergy = currentLifeEnergy + point
	update.emit()

func updatedLifeEnergy(_currentLifeEnergy: int) -> void:
	currentLifeEnergy = _currentLifeEnergy
	update.emit()
