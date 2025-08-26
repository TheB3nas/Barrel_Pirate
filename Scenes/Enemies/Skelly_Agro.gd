extends State

var timer: int

func Enter():
	timer = 30
	entity.can_move = false
	animation_tree["parameters/conditions/Agro"] = true
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Strike"] = false


func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro walk")

func hit():
	Transition.emit(self, "hit")
