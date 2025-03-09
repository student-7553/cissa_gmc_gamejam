extends Node3D

class_name GameManager
signal gameStateUpdate(newState: GameState)


@export var winConditionLifeEnergy: int = 10000

enum GameState {GAME_OVER, GAME_FINISHED, PLAYING}

var lifeEnergyManager: LifeEnergyManager
var cardManager: CardManager
var gameState: GameState = GameState.PLAYING


func checkGameOver() -> void:
	if cardManager.currentStackCards.size() == 0:
		gameState = GameState.GAME_OVER
		gameStateUpdate.emit(gameState)
	pass


func checkGameComplete():
	if lifeEnergyManager.currentLifeEnergy >= winConditionLifeEnergy:
		gameState = GameState.GAME_FINISHED
		gameStateUpdate.emit(gameState)
	pass

func _ready() -> void:
	lifeEnergyManager = get_node("../LifeEnergyManager")
	cardManager = get_node("../CardManager")

	cardManager.cardStackUpdate.connect(checkGameOver)
	lifeEnergyManager.update.connect(checkGameComplete)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
