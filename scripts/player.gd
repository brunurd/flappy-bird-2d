extends Node

export var scrollSpeed: float
export var planeForce: float

onready var mainCamera: Camera2D = get_node("MainCamera")
onready var plane: RigidBody2D = get_node("Plane")
onready var planeAnimated: AnimatedSprite = get_node("Plane/PlaneAnimated")

func _ready():
	planeAnimated.playing = true

func _physics_process(delta):
	plane.apply_impulse(Vector2.RIGHT, Vector2(scrollSpeed, 0))
	mainCamera.position.x = plane.position.x

func _input(event):
	if event is InputEventKey and event.scancode == KEY_SPACE:
		plane.apply_impulse(Vector2.UP, Vector2(0, -planeForce))
