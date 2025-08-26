extends State

var speed = 250
var drunk_dir: Vector2
var player: CharacterBody2D
var timer: int
var drunk_walk
var distance = 300

func randomize_wander():
	distance = (player.global_position - entity.global_position)
	if distance.length() > 300:
		timer = randi_range(10, 30)
		drunk_walk = Vector2(randf_range(-300, 300), randf_range(-300, 300))
	else:
		timer = randi_range(30, 50)
		drunk_walk = Vector2(randf_range(-100, 100), randf_range(-100, 100))

func Enter():
	entity.can_move = true
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = true
	animation_tree["parameters/conditions/Strike"] = false
	
func Update(delta):
	entity.direction = (player.global_position - entity.global_position + drunk_walk).normalized()
	if entity.can_move:
		entity.velocity = speed * entity.direction
	distance = (player.global_position - entity.global_position + drunk_walk)
	if distance.length() > 1000:
		Transition.emit(self, "idle")
	if distance.length() < 150 and entity.can_strike:
		Transition.emit(self, "strike")
	
	if timer > 0:
		timer -= delta
	else:
		randomize_wander()
		

func hit():
	Transition.emit(self, "hit")
