extends Resource
class_name Card


@export var scene: PackedScene

@export var cellKey: PossibleCell

@export var cardSpriteScene: PackedScene


enum PossibleCell {
	FOREST = 0, GROUND = 1, LAVA = 2, OCEAN = 3, MOUNTAIN = 4, ARCTIC = 5, BEACH = 6
}
