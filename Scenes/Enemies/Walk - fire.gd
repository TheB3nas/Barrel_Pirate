extends State
class_name Bombling_Deagro

var speed = 250
var direction: Vector2
var player: CharacterBody2D

func Enter():
	entity.can_move = true
	player = get_tree().get_first_node_in_group("Player")
	animation_tree["parameters/conditions/Walk_fire"] = true
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/deagro"] = false
	animation_tree["parameters/conditions/Hit_fire"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Fuse"] = false
	
func Update(_delta):
	entity.direction = (player.global_position - entity.global_position).normalized()
	if entity.can_move:
		entity.velocity = speed * entity.direction
	var distance = (player.global_position - entity.global_position)
	if distance.length() > 800:
		Transition.emit(self, "deagro")
	if distance.length() < 150:
		Transition.emit(self, "Fuse")

func hit():
	Transition.emit(self, "hit fire")
