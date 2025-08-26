extends State
var player: CharacterBody2D
var timer: int = 10
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	var distance = (player.global_position - entity.global_position)
	if distance.length() < 170:
		player.hit(entity.enemy_damage)
	entity.can_move = false
	timer = 30
	entity.can_strike = false
	$"../../Timers/Timer".start()
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Attack"] = true
	animation_tree["parameters/conditions/End"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Slam"] = false
	animation_tree["parameters/conditions/Walk"] = false
	
	
func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro idle")

func death():
	Transition.emit(self, "death")
