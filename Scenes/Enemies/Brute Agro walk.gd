extends State

var speed = 300
var player: CharacterBody2D
var timer: int
var distance
@onready var navigation: NavigationAgent2D = $"../../NavigationAgent2D"
var seen: bool
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	$"../../Timers/Newpath".start()
	entity.can_move = true
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Attack"] = false
	animation_tree["parameters/conditions/End"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Slam"] = false
	animation_tree["parameters/conditions/Walk"] = true
	seen = true
	
func Physics_update(delta):
	entity.direction = (navigation.get_next_path_position() - entity.global_position).normalized()

func Update(_delta):
	if entity.can_move:
		entity.velocity = entity.direction * speed
	distance = (player.global_position - entity.global_position)
	if distance.length() > 1000:
		Transition.emit(self, "idle")
	if distance.length() < 170 and entity.can_strike:
		Transition.emit(self, "attack")
	elif distance.length() < 170 and not entity.can_strike:
		Transition.emit(self, "agro idle")
	elif entity.can_slam:
		Transition.emit(self, "slam")

func death():
	Transition.emit(self, "death")



func _on_newpath_timeout():
	navigation.target_position = player.global_position


	
