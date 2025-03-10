extends Control

@onready var settingsPanelButton: TextureButton = $TextureButton
@onready var settings_menu: Control = $SettingsMenu

func _ready() -> void:
	handle_connecting_signals()

func on_settings_pressed() -> void:
	settings_menu.visible = true
	settings_menu.set_process(true)
	
func on_exit_settings_menu() -> void:
	settings_menu.visible = false

func handle_connecting_signals() -> void:
	settingsPanelButton.button_down.connect(on_settings_pressed)
	settings_menu.exit_settings_menu.connect(on_exit_settings_menu)
