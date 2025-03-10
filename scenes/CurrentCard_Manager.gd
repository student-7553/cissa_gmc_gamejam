extends Node2D
class_name Current_Card
var cardManager: CardManager

@export var cardHolder: Control
var currentCard: Card
#var dict = {
	#'Forest' : Card,
	#'Ground' : Card, 
	#'Lava' : Card,
	#'Ocean' : Card,
	#'Mountain' : Card,
	#'Artic' : Card,
	#'Beach' : Card
#}
var dict = {}

var CardTypes: Array[Card] = []

func _ready() -> void:
	cardHolder = get_node("CardHolder")

func Initialize_Card_Types_List() -> void:
	#for every child node, add to a list
	for card in cardManager.currentStackCards:
		CardTypes.append(card)
		#Card_Holder.get_child(index)
		if card not in dict:
			dict.assign({card: cardManager.card.cellKey})
		print(CardTypes[card])
	print(CardTypes)
		
	#making a dict is probably better, 
	for index in cardHolder.get_child_count():
		dict.assign({"Beach": cardHolder.get_child(0)})
	#pass
	
	
func Switch_CurrentCard(Card) -> void:
	cardManager.cardStackUpdate
	#cardManager.getTopCard()
	#cardManager.currentStackCards[n].cellKey = 3
	
	#this is likely not the way to get the currencard
	currentCard = cardManager.getTopCard()
		
	#switches off all card Nodes before turning on the current one
	for card in dict.keys():
		if card == currentCard:
			card.visible = true
		else:
			card.visible = false
	#currentCard.visible = true
