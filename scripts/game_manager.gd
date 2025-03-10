extends Node3D

class_name GameManager
signal gameStateUpdate(newState: GameState)

@export var level_manager: Level_Manager
@export var lifeEnergyManager: LifeEnergyManager

enum GameState {GAME_OVER, GAME_FINISHED, PLAYING}

var gameState: GameState = GameState.PLAYING

func checkGameOver() -> void:
	if Globals.card_manager.lose_condition():
		gameState = GameState.GAME_OVER
		gameStateUpdate.emit(gameState)

func checkGameComplete():
	if level_manager.win_condition():
		gameState = GameState.GAME_FINISHED
		gameStateUpdate.emit(gameState)
		return true

func _ready() -> void:
	Globals.card_manager.drawn_card.connect(checkGameOver)
	
	## Level 1 start
	lifeEnergyManager.increment_level.connect(next_level)
	next_level()

func next_level():
	level_manager.next_level()
	if checkGameComplete():
		return
	level_manager.present_choices()
	lifeEnergyManager.set_level(level_manager.current_level())
	print("START LEVEL ",level_manager.current_level())
