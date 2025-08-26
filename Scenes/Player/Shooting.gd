extends State

class_name Player_Shooting
var dash_speed = 500
var knockback = false
var timer: int


func Enter():
	timer = 10
	entity.can_shoot = false
	$"../../Timers/Can_shoot".start()
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Shoot"] = true
	animation_tree["parameters/conditions/Hit"] = false
	var pos: Node2D
	var threshold = 0.001
	var markers = $"../../Markers"
	if entity.shoot_direction == Vector2(0, 1):
		pos = markers.get_child(0)
	if entity.shoot_direction == Vector2(1, 0)or (entity.shoot_direction - Vector2(0.707107, -0.707107)).length() < threshold or (entity.shoot_direction - Vector2(0.707107, 0.707107)).length() < threshold:
		pos = markers.get_child(1)
	if entity.shoot_direction == Vector2(0, -1):
		pos = markers.get_child(2)
	if entity.shoot_direction == Vector2(-1, 0) or (entity.shoot_direction - Vector2(-0.707107, -0.707107)).length() < threshold or (entity.shoot_direction - Vector2(-0.707107, 0.707107)).length() < threshold:
		pos = markers.get_child(3)
	knockback = true
	$"../../Timers/Knockback".start()
	entity.cannon_shot.emit(pos.global_position, entity.shoot_direction)
	

func Update(_delta: float):
	# Not fun to play with knockback
	#if knockback:
		#var dash_vector = dash_speed * entity.shoot_direction
		#entity.velocity = -dash_vector
	#else:
		if entity.velocity != Vector2.ZERO:
			Transition.emit(self, "walk")
		else:
			Transition.emit(self, "idle")
func hit():
	Transition.emit(self, "hit")
