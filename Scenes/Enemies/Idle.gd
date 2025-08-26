extends State
class_name Bombling_Idle

var timer: int
var player: CharacterBody2D

func randomize_timer():
	timer = randf_range(30, 100)

func Enter():
	randomize_timer()
	entity.can_move = false
	animation_tree["parameters/conditions/Idle"] = true
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/deagro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Hit_fire"] = false
	player = get_tree().get_first_node_in_group("Player")
	

func Update(delta):
	var distance = (player.global_position - entity.global_position)
	if distance.length() < 700:
		Transition.emit(self, "agro")
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "walk - no fire")

func hit():
	Transition.emit(self, "hit no fire")
