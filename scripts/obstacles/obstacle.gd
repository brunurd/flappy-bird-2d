extends Node2D

onready var area: Area2D = get_node("Area2D")
onready var constants: Node = get_node("/root/Constants")

var passed: bool = false

func _physics_process(delta: float):
	check_overlapping_bodies()

func check_overlapping_bodies():
	var bodies: Array = area.get_overlapping_bodies()
	for body in bodies:
		if body.get_name() == constants.PLAYER_NODE and !passed:
			passed = true
			var manager = get_parent()
			manager.instantiate_obstacle()
			manager.add_point()