extends State
var player: CharacterBody2D
var speed = 700
var distance
var end_spot
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	entity.direction = (player.global_position - entity.global_position).normalized()
	
	end_spot = player.global_position + player.direction
	entity.can_move = true
	entity.can_slam = false
	$"../../Timers/Can slam".start()
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Attack"] = false
	animation_tree["parameters/conditions/End"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Slam"] = true
	animation_tree["parameters/conditions/Walk"] = false
	$"../../CollisionShape2D".disabled = true
	
func Update(delta):
	distance = (end_spot - entity.global_position)
	if distance.length() > -10 and distance.length() < 10:
		Transition.emit(self, "slam end")
	if entity.can_move:
		entity.velocity = speed * entity.direction


func death():
	Transition.emit(self, "death")
