extends Node3D
class_name Sound_Manager

@onready var sfx_OpenCards: AudioStreamPlayer = $OpenCards
@onready var sfx_Hover: AudioStreamPlayer = $Hover
@onready var sfx_PlaceNode_1: AudioStreamPlayer = $PlaceNodes/PlaceNode_1
@onready var sfx_PlaceNode_2: AudioStreamPlayer = $PlaceNodes/PlaceNode_2
@onready var sfx_PlaceNode_3: AudioStreamPlayer = $PlaceNodes/PlaceNode_3

func _ready() -> void:
	Globals.sound_manager = self

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("TEMP_SfxTrigger"):
		if not sfx_OpenCards.is_playing():
			sfx_OpenCards.play()
	if Input.is_action_just_pressed("TEMP_SFX_PlaceNode_Trigger"):
		if not sfx_PlaceNode_1.is_playing():
			sfx_PlaceNode_1.play()
