extends Resource
class_name Card


@export var scene: PackedScene

@export var cellKey: PossibleCell

@export var cardSpriteScene: PackedScene = null

@export var roulette_entries: int = 3 ## How many to instance in a new roulette array

enum PossibleCell {
	FOREST = 0, GROUND = 1, LAVA = 2, OCEAN = 3, MOUNTAIN = 4, ARCTIC = 5, BEACH = 6, CAMP = 7
}
