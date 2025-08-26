extends State

var player: CharacterBody2D
var timer: int
var distance

func Enter():
	entity.can_move = false
	player = get_tree().get_first_node_in_group("Player")
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Attack"] = false
	animation_tree["parameters/conditions/End"] = false
	animation_tree["parameters/conditions/Idle"] = true
	animation_tree["parameters/conditions/Slam"] = false
	animation_tree["parameters/conditions/Walk"] = false
	
func Update(_delta):
	distance = (player.global_position - entity.global_position)
	if distance.length() > 250:
		Transition.emit(self, "agro walk")
	if distance.length() < 170 and entity.can_strike:
		Transition.emit(self, "attack")
	elif entity.can_slam:
		Transition.emit(self, "slam")

func death():
	Transition.emit(self, "death")
