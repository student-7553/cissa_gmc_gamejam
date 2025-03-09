extends Node3D

class_name LifeEnergyManager

signal update

@export var currentLifeEnergy: int = 0

func updatedLifeEnergy(_currentLifeEnergy: int) -> void:
    currentLifeEnergy = _currentLifeEnergy
    update.emit()
    pass