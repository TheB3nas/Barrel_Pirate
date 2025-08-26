extends State


func Enter():
	entity.can_move = true
	player = get_tree().get_first_node_in_group("Player")
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle_Agro"] = false
	animation_tree["parameters/conditions/Walk_Agro"] = true
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Shoot_Walk"] = false

var speed = 300
var direction: Vector2
var player: CharacterBody2D


func Update(_delta):
	entity.direction = (player.global_position - entity.global_position).normalized()
	var facing_dir = -(player.global_position - entity.global_position).normalized()
	var distance = (player.global_position - entity.global_position)
	if entity.can_move:
		entity.velocity = speed * facing_dir
	if distance.length() > 700:
		Transition.emit(self, "agro_idle")
	if entity.can_shoot: 
		entity.can_shoot = false
		$"../../Can_shoot".start()
		Transition.emit(self, "f_shooting_walk")

#If distance is far away ž, the dude will walk towards a certain point and if the


func hit():
	Transition.emit(self, "f_hit")
