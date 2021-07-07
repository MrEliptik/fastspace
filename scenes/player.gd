extends RigidBody2D

var dir: float = 0.0
var thrust: float = 0.0
var thrust_force: float = 1200.0
var torque_force: float = 9000.0

func _ready():
	$CollisionPolygon2D.polygon = $Polygon2D.polygon
	
func _process(delta):
	dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	thrust = Input.get_action_strength("thrust")
	
func _physics_process(delta):
	set_applied_force(-global_transform.y * thrust * thrust_force)
	
	set_applied_torque(dir * torque_force)
	
func die():
	get_tree().reload_current_scene()

func _on_Player_body_entered(body):
	if !body.is_in_group("DeadlyObstacles"): return
	die()
