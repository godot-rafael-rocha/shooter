extends CharacterBody2D

const speed = 400

func _process(_delta: float) -> void:
	
	# Input
	var direction = Vector2.RIGHT
	velocity = direction * speed
	move_and_slide()
	
