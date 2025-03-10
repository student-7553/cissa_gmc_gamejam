extends Panel

@export var gameOverTitle = "No Humans were born, the world stayed silent"
@export var gameFinishedTitle = "The first Human was born, humankind has successfully evolved"

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
	$GameOverBackdrop.visible = true
	$GameWinBackdrop.visible = false
	$MainLabel.text = gameOverTitle
	pass # Replace with function body.

func triggerGameComplete() -> void:
	visible = true
	$GameOverBackdrop.visible = false
	$GameWinBackdrop.visible = true
	$MainLabel.text = gameFinishedTitle
	pass # Replace with function body.
