extends Control

@onready var button_exit: Button = $MarginContainer/VBoxContainer/Button_Exit

signal exit_settings_menu

func _ready() -> void:
	button_exit.button_down.connect(on_exit_pressed)
	set_process(false)
	
func on_exit_pressed() -> void:
	exit_settings_menu.emit()
	set_process(false)
	
