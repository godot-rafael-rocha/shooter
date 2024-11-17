extends CharacterBody2D

const speed = 800
@onready var laser_reload_timer: Timer = $Cooldowns/LaserReloadTimer
@onready var grenade_reload_timer: Timer = $Cooldowns/GrenadeReloadTimer

var can_laser = true
var can_grenade = true

signal laser(pos: Vector2, direction: Vector2)
signal grenade(pos: Vector2, direction: Vector2)

func _process(delta: float) -> void:
	
	# Input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# Rotate
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# Laser shooting
	if Input.is_action_pressed("primary action") && can_laser:
		var laser_marks = $LaserStartPositions.get_children()
		var selected_mark: Marker2D = laser_marks[randi() % laser_marks.size()]
		can_laser = false
		laser_reload_timer.start()
		
		laser.emit(selected_mark.global_position, player_direction)

	if Input.is_action_pressed("secondary action") && can_grenade:
		var laser_marks = $LaserStartPositions.get_children()
		var selected_mark: Marker2D = laser_marks[0]
		
		can_grenade = false
		grenade_reload_timer.start()
		
		grenade.emit(selected_mark.global_position, player_direction)


func _on_laser_reload_timer_timeout() -> void:
	can_laser = true


func _on_grenade_reload_timer_timeout() -> void:
	can_grenade = true
