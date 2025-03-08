extends Node

class_name hex_cell


# Possible improvement this script itself handles showing the cell 

# How do we handle the synergy
 
var currentPoint = 0

var basePoint = 0

var nodePosition: Vector2 = Vector2.ZERO

func init(_nodePosition: Vector2, _basePoint: int):
	nodePosition = _nodePosition
	basePoint = _basePoint
	currentPoint = basePoint
	
func _ready() -> void:
	pass
