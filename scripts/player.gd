extends Node

export var planeForce: float

const MAX_DEGREE_LIMIT: float = 45.0

onready var plane: RigidBody2D = get_node("Plane")
onready var planeAnimated: AnimatedSprite = get_node("Plane/PlaneAnimated")

func _ready():
	planeAnimated.playing = true

func _input(event):
	if event is InputEventKey and event.scancode == KEY_SPACE:
		plane.apply_impulse(Vector2.UP, Vector2(0, -planeForce))

func _physics_process(delta):
	rotatePlane()
	checkCollisionBodies()

func rotatePlane():
	if plane.linear_velocity.y >= -MAX_DEGREE_LIMIT and plane.linear_velocity.y <= MAX_DEGREE_LIMIT:
		planeAnimated.rotation_degrees = plane.linear_velocity.y

func checkCollisionBodies():
	var bodies: Array = plane.get_colliding_bodies()
	for body in bodies:
		if body.get_name() == "Floor" or body.get_name() == "Wall":
			lose()

func lose():
	var error: int = get_tree().change_scene("res://scenes/main.tscn")
