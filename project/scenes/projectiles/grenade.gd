extends RigidBody2D

@export var speed = 750
#@export var max_distance = 250
#@export var persistence_time = 10
#var direction := Vector2.UP
#var _distance_traveled = 0
#
#@onready var timer: Timer = $Timer
#
#func _process(delta: float) -> void:
	#if (_distance_traveled >= max_distance):
		#return
	#
	#var additional_distance_traveled: int = speed * delta
	#
	#if _distance_traveled + additional_distance_traveled >= max_distance:
		#additional_distance_traveled = max_distance - _distance_traveled
		#if persistence_time > 0:
			#timer.wait_time = persistence_time
			#timer.start()
		#else:
			#destroy_projectile()
	#
	#_distance_traveled += additional_distance_traveled
	#position += direction * additional_distance_traveled
	#pass
#
#func destroy_projectile():
	#self.queue_free()
#
#func _on_timer_timeout() -> void:
	#destroy_projectile()
