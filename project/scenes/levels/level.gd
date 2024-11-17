extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate() -> void:
	print("Player entered gate")

func _on_gate_player_exited_gate() -> void:
	print("Player exited gate")

func _on_player_laser(pos: Vector2, direction: Vector2) -> void:
	var laser: Area2D = laser_scene.instantiate()
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)

func _on_player_grenade(pos: Vector2, direction: Vector2) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	add_child(grenade)
	print("_on_player_grenade")
