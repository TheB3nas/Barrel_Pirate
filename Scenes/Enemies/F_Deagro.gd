extends State

var timer: int

func Enter():
	timer = 10
	animation_tree["parameters/conditions/Deagro"] = true
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle_Agro"] = false
	animation_tree["parameters/conditions/Walk_Agro"] = false
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Shoot_Walk"] = false

func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "idle")

func hit():
	Transition.emit(self, "f_hit")
