extends Node3D

@export var arrayRowSize = 10
@export var arrayColumnSize = 10

@export var cellScene: PackedScene

var grid: Array[Array] = []

func _ready() -> void:
	for n in arrayRowSize:
		var newRow = []

		for i in arrayColumnSize:
			var cellNode = cellScene.instantiate()

			add_child(cellNode)
			newRow.append(cellNode)

		grid.push_front(newRow)

	pass
