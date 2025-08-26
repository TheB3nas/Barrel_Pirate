extends State

var timer: int

func Enter():
	$"../../Timers/Can slam".start()
	timer = 30
	entity.can_move = false
	animation_tree["parameters/conditions/Agro"] = true
	animation_tree["parameters/conditions/Attack"] = false
	animation_tree["parameters/conditions/End"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Slam"] = false
	animation_tree["parameters/conditions/Walk"] = false


func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro walk")


func death():
	Transition.emit(self, "death")
