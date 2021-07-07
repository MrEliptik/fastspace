extends Node2D

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_EndArea_player_finished():
	get_tree().reload_current_scene()
