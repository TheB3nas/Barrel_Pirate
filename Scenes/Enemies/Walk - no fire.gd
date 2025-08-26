extends State
class_name Bombling_Walking

var timer: int
var speed: int = 150

var move_times: int
var player: CharacterBody2D

func randomize_wander():
	entity.direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	timer = randf_range(30, 60)
func randomize_move_times():
	move_times = randf_range(1, 3)

func Enter():
	entity.can_move = true
	randomize_wander()
	randomize_move_times()
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = true
	animation_tree["parameters/conditions/Walk_fire"] = false
	animation_tree["parameters/conditions/deagro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Hit_fire"] = false
	player = get_tree().get_first_node_in_group("Player")

func Update(delta):
	var distance = (player.global_position - entity.global_position)
	if distance.length() < 700:
		Transition.emit(self, "agro")
	if entity.can_move:
		entity.velocity = speed * entity.direction
	if timer > 0:
		timer -= delta
	else:
		if move_times > 0:
			move_times -= 1
			randomize_wander()
		else:
			Transition.emit(self, "idle")

func hit():
	Transition.emit(self, "hit no fire")
