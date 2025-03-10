extends HBoxContainer

var currentSpawnedNodes: Array[Node] = []

#func _ready() -> void:
	#Globals.card_manager.cardStackUpdate.connect(handleCardStackUpdate)
#
#func handleCardStackUpdate() -> void:
	#if currentSpawnedNodes.size() == 0:
		#for card in cardManager.currentStackCards:
			#var newSpriteNode = card.cardSpriteScene.instantiate()
			#add_child(newSpriteNode)
			#currentSpawnedNodes.append(newSpriteNode)
		#
		#return
#
	#var deleteCount = currentSpawnedNodes.size() - cardManager.currentStackCards.size()
#
	#for index in deleteCount:
		#currentSpawnedNodes[0].queue_free()
		#currentSpawnedNodes.pop_front()
		#pass
