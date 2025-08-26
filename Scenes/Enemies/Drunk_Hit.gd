extends State

var timer: int

func Enter():
	timer = 5
	entity.can_move = true
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = true
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Strike"] = false
	$"../../Flip/Strikebox/AnimationTree"["parameters/conditions/Strike_box"] = false
	$"../../Flip/Strikebox/AnimationTree"["parameters/conditions/Empty"] = true

func Update(delta):
	if entity.hit_points <= 0:
		Transition.emit(self, "death")
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro walk")

func hit():
	pass
