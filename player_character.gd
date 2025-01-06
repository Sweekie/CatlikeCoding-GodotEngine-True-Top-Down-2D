extends CharacterBody2D


@export_range(0, 1000) var speed := 60


func _physics_process(_delta: float) -> void:
	get_play_input()
	move_and_slide()

func get_play_input() -> void:
	var vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = vector * speed
