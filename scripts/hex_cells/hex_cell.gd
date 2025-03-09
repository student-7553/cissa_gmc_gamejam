extends Node3D
class_name Hex_Cell

@export var card: Card
@export var synergy: Synergy

var current_score = 0
var base_score = 0
var save_pos: Vector3
var cube_coord: Vector3 ## Position in the hex grid (q, r, s)

var cardNode: Node = null

var isHovered: bool = false

signal select_cell(cell: Hex_Cell)

func _ready() -> void:
	save_pos = position

func handleClick(nextCard: Card) -> void:
	if cardNode != null:
		var checkNode = cardNode.get_node("check")
		assert(checkNode != null)
		if checkNode.checkIfValidToPlace(nextCard): ## Check logic
			print("Not possible to place this node down on the existing node")
			return
	print("Success: Placed the node down")
	setCard(nextCard)

func setCard(_card: Card) -> void:
	cardNode = _card.scene.instantiate()
	add_child(cardNode)
	# todo the bottom y positon should be dynamic
	cardNode.translate(Vector3(0, 0.25, 0))

func init_cell(_cube_coord: Vector3, _card: Card) -> void:
	cube_coord = _cube_coord
	card = _card

## Called when a cell is being replaced
func copy_cell_data(cell: Hex_Cell):
	cube_coord = cell.cube_coord
	card = cell.card
	save_pos = cell.save_pos
	current_score = cell.current_score
	base_score = cell.base_score
	position = cell.position

func pop_up():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y + 0.51, 0.25)

func pop_down():
	var tw: Tween = get_tree().create_tween()
	tw.tween_property(self, "position:y", save_pos.y, 0.25)

func mouse_entered() -> void:
	select_cell.emit(self)
