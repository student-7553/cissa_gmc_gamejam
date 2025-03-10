extends Node
class_name Sound_Manager

@onready var sfx_OpenCards: AudioStreamPlayer = $OpenCards
@onready var sfx_Hover: AudioStreamPlayer = $Hover
@onready var sfx_PlaceNode_1: AudioStreamPlayer = $PlaceNodes/PlaceNode_1
@onready var sfx_PlaceNode_2: AudioStreamPlayer = $PlaceNodes/PlaceNode_2
@onready var sfx_PlaceNode_3: AudioStreamPlayer = $PlaceNodes/PlaceNode_3
@onready var sfx_ViewCard: AudioStreamPlayer = $ViewCard
@onready var sfx_LowerCard: AudioStreamPlayer = $LowerCard
@onready var sfx_ShipHover: AudioStreamPlayer = $SpaceShipHover

func _ready() -> void:
	Globals.sound_manager = self

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("TEMP_SfxTrigger"):
		if not sfx_OpenCards.is_playing():
			sfx_OpenCards.play()

func sfx_place_node():
	var rng = randi_range(0, 2)
	match rng:
		0:
			sfx_PlaceNode_1.play()
		1:
			sfx_PlaceNode_2.play()
		2:
			sfx_PlaceNode_3.play()
