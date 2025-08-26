extends State

var timer: int

func Enter():
	timer = 10
	entity.can_move = false
	animation_tree["parameters/conditions/Deagro"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Idle_Agro"] = false
	animation_tree["parameters/conditions/Walk_Agro"] = false
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Shoot_Walk"] = false
	animation_tree["parameters/conditions/Hit"] = true

func Update(delta):
	if entity.hit_points <= 0:
		Transition.emit(self, "f_death")
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro_idle")

func hit():
	pass
