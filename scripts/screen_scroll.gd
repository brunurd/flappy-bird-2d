extends Node2D

export var scroll_speed: float

func _process(delta: float):
	translate(Vector2(scroll_speed * delta, 0))