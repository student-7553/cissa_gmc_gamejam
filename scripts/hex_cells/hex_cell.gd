extends Node3D
class_name Hex_Cell

@export var cell_type: Card.PossibleCell
@export var score_indicator: Score_Indicator

@onready var check_node: BaseCheck = $check
@onready var synergy: Synergy = $synergy

var current_score = 0
var base_score = 0
var save_pos: Vector3
var cube_coord: Vector3 ## Position in the hex grid (q, r, s)

var isHovered: bool = false

signal select_cell(cell: Hex_Cell)

func _ready() -> void:
	save_pos = position
	synergy.increase_score.connect(increase_score)

func increase_score(amount: int):
	current_score += amount
	if score_indicator:
		score_indicator.play_anim()

## Called when a cell is being replaced
func copy_cell_data(cell: Hex_Cell):
	cube_coord = cell.cube_coord
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
