extends CharacterBody2D


@export var initial_velocity := Vector2.ZERO
@export_range(0, 1000) var speed := 60


func _ready() -> void:
	velocity = initial_velocity

func _physics_process(_delta: float) -> void:
	get_play_input()
	if move_and_slide():
		resolve_collisions()

func resolve_collisions() -> void:
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var body := collision.get_collider() as MovableObject
		if body:
			body.apply_impact((velocity))

func get_play_input() -> void:
	var vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = vector * speed
