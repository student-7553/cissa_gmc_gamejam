extends Node3D
class_name Sound_Manager

@onready var sfx_OpenCards: AudioStreamPlayer = $AudioStreamPlayer_OpenCards
@onready var sfx_Hover: AudioStreamPlayer = $AudioStreamPlayer_Hover

func _ready() -> void:
	Globals.sound_manager = self

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("TEMP_SfxTrigger"):
		if not sfx_OpenCards.is_playing():
			sfx_OpenCards.play()
