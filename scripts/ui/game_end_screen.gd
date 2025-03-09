extends Panel

@export var gameOverTitle = "Game Over"
@export var gameFinishedTitle = "Humankind has been successfully nurtured"

func _ready() -> void:
	var gameManager = get_node("../../GameManager")
	gameManager.gameStateUpdate.connect(handleGameStateUpdate)
	pass

func handleGameStateUpdate(newState: GameManager.GameState):
	match newState:
		GameManager.GameState.GAME_OVER:
			triggerGameOver()
		GameManager.GameState.GAME_FINISHED:
			triggerGameComplete()
	pass

func triggerGameOver() -> void:
	visible = true
	$MainLabel.text = gameOverTitle
	pass # Replace with function body.

func triggerGameComplete() -> void:
	visible = true
	$MainLabel.text = gameFinishedTitle
	pass # Replace with function body.
