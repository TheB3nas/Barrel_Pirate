extends State

var timer: int

func Enter():
	timer = 10
	entity.can_move = false
	animation_tree["parameters/conditions/Agro"] = true
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = false


func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro_idle")

func hit():
	Transition.emit(self, "f_hit")
