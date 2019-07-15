extends Node2D

export var scrollSpeed: float

func _process(delta):
	translate(Vector2(scrollSpeed * delta, 0))