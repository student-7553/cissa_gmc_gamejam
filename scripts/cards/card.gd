extends Resource
class_name Card

@export var cardSprite: Texture2D

@export var scene: PackedScene

@export var cellKey: PossibleCell


enum PossibleCell {
	FOREST = 0, GROUND = 1, LAVA = 2, OCEAN = 3, MOUNTAIN = 4, ARCTIC = 5, BEACH = 6
}
