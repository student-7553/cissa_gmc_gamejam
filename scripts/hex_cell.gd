extends Node3D
class_name Hex_Cell


const ANGLE: float = 60
const CELL_WIDTH: float = 2
const SIDES: int = 6
const HEX_DIRECTIONS: Array[Vector3] = [Vector3(0, 1, 0), Vector3(0, 0, 1), Vector3(1, 0, 0), Vector3(0, -1, 0), Vector3(0, 0, -1), Vector3(-1, 0, 0)]

var current_score = 0
var base_score = 0
var save_pos: Vector3
var cube_coord: Vector3 ## Position in the hex grid (q, r, s)
var neighbours: Array[Hex_Cell]

var card: Card = null
var cardNode: Node = null

var isHovered: bool = false

signal select_cell(cell: Hex_Cell)

func _ready() -> void:
	save_pos = position

func find_neighbours():
	"""
	Could declare a reference to grid and simply reference the array
	"""
	pass

func handleClick(nextCard: Card) -> void:
	select_cell.emit(self)
	print(cube_coord)

	if cardNode != null:
		var checkNode = cardNode.get_node("check")
		assert(checkNode != null)
		if checkNode.checkIfValidToPlace(nextCard):
			print("Not possible to place this node down on the existing node")
			return

	print("Success: Placed the node down")

	setCard(nextCard)
	

func setCard(_card: Card) -> void:
	cardNode = _card.nodeMeshScene.instantiate()
	
	add_child(cardNode)

	# todo the bottom y positon should be dynamic
	cardNode.translate(Vector3(0, 0.25, 0))

	pass

func initCell(_cube_coord: Vector3, card: Card) -> void:
	cube_coord = _cube_coord
	# setCard(card)
	pass

func pop_up():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 0.51, 0.25)

func pop_down():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25)
	tw.tween_callback(find_neighbours)

func _on_area_3d_mouse_entered() -> void:
	select_cell.emit(self)
