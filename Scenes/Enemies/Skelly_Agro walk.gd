extends State

var speed = 250
var player: CharacterBody2D
var timer: int
var distance

func Enter():
	entity.can_move = true
	player = get_tree().get_first_node_in_group("Player")
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = true
	animation_tree["parameters/conditions/Strike"] = false
	
func Update(_delta):
	entity.direction = (player.global_position - entity.global_position).normalized()
	if entity.can_move:
		entity.velocity = speed * entity.direction
	distance = (player.global_position - entity.global_position)
	if distance.length() > 1000:
		Transition.emit(self, "idle")
	if distance.length() < 200 and entity.can_strike:
		Transition.emit(self, "strike")
		

func hit():
	Transition.emit(self, "hit")
