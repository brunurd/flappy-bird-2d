extends Node2D

export var plane_force: float

const MAX_DEGREE_LIMIT: float = 45.0

onready var plane: RigidBody2D = get_node("Plane")
onready var plane_animated: AnimatedSprite = get_node("Plane/PlaneAnimated")
onready var constants: Node = get_node("/root/Constants")

func _ready():
	plane_animated.playing = true

func _input(event: InputEvent):
	if event is InputEventKey and event.scancode == KEY_SPACE:
		plane.apply_impulse(Vector2.UP, Vector2(0, -plane_force))

func _physics_process(delta: float):
	rotate_plane()
	check_collision_bodies()

func rotate_plane():
	if plane.linear_velocity.y >= -MAX_DEGREE_LIMIT and plane.linear_velocity.y <= MAX_DEGREE_LIMIT:
		plane_animated.rotation_degrees = plane.linear_velocity.y

func check_collision_bodies():
	var bodies: Array = plane.get_colliding_bodies()
	for body in bodies:
		if body.get_name() == constants.FLOOR_NODE or constants.OBSTACLE_NODE in body.get_name():
			lose()

func lose():
	var error: int = get_tree().change_scene("res://scenes/main.tscn")
