extends State
var player: CharacterBody2D
var timer: int
var distance
var speed = 350
func Enter():
	entity.can_strike = false
	$"../../Timers/Timer".start()
	player = get_tree().get_first_node_in_group("Player")
	distance = (player.global_position - entity.global_position)
	entity.can_move = false
	timer = 50
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Attack"] = false
	animation_tree["parameters/conditions/End"] = true
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Slam"] = false
	animation_tree["parameters/conditions/Walk"] = false
	$"../../CollisionShape2D".disabled = false
	if distance.length() < 170:
		player.hit(entity.enemy_damage)
	
func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro idle")
	if entity.can_move:
		entity.velocity = speed * entity.direction

func death():
	Transition.emit(self, "death")
