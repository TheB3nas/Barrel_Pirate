extends State

var timer: int
var player: CharacterBody2D

func randomize_timer():
	timer = randi_range(30, 60)

func Enter():
	entity.can_move = false
	randomize_timer()
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle"] = true
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Strike"] = false
	player = get_tree().get_first_node_in_group("Player")

func Update(delta):
	var distance = (player.global_position - entity.global_position)
	if distance.length() < 700:
		Transition.emit(self, "agro")
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "walk")

func hit():
	Transition.emit(self, "hit")
