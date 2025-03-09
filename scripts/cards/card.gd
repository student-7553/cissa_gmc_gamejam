extends Resource
class_name Card

@export var cardSprite: Texture2D

@export var nodeMeshScene: PackedScene

@export var cellKey: PossibleCell


enum PossibleCell {
	FOREST, GROUND, LAVA, OCEAN, MOUNTAIN, ARCTIC, BEACH
}
