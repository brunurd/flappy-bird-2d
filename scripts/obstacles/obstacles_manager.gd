extends Node2D

onready var obstacle_reference: PackedScene = preload("res://scenes/entities/obstacle.tscn")
onready var label: Label = get_node("/root/Main/CanvasLayer/Label")

var last_x_pos: int = 0
var points: int = 0

const MIN_DISTANCE: int = 200
const MAX_DISTANCE: int = 250

const UP: int = 0
const DOWN: int = 1

func _ready():
	initial_batch()
	label.set_text(str(points))

func initial_batch():
	for i in range(0, 3):
		instantiate_obstacle()

func instantiate_obstacle():
	var obstacle: StaticBody2D = obstacle_reference.instance()
	var distance: int = randi() % MAX_DISTANCE + MIN_DISTANCE
	var up_or_down: int = randi() % 2
	
	add_child(obstacle)
	
	if up_or_down == DOWN:
		obstacle.position = Vector2(last_x_pos + distance, 350)
	
	else:
		obstacle.position = Vector2(last_x_pos + distance, 118)
		obstacle.scale = Vector2(1,-1)
	
	last_x_pos += distance

func add_point():
	points += 1
	label.set_text(str(points))