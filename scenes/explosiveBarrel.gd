extends RigidBody2D

var exploded = false

func _ready():
	pass 

func _on_ExplosiveBarrel_body_entered(body):
	if !body.is_in_group("Player"): return
	$Timer.start()
	
func explode():
	if exploded: return
	exploded = true
	var bodies = $Area2D.get_overlapping_bodies()
	print(bodies)
	if bodies.size() == 0: return
	
	for body in bodies:
		if body.is_in_group("Player"):
			body.die()
		elif body.is_in_group("Explosives"):
			body.explode()
			
	call_deferred("queue_free")

func _on_Timer_timeout():
	explode()
