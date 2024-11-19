extends StaticBody2D

signal player_entered_gate
signal player_exited_gate

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_entered_gate.emit()


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_exited_gate.emit()
