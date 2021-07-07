extends Area2D

signal player_finished()

func _on_EndArea_body_entered(body):
	if !body.is_in_group("Player"): return
	emit_signal("player_finished")
	
