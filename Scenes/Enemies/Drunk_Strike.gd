extends State

var timer: int = 10
func Enter():
	entity.can_move = false
	timer = 40
	$"../../Timers/Can strike".start()
	entity.can_strike = false
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/Hit"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Strike"] = true
	$"../../Flip/Strikebox/AnimationTree"["parameters/conditions/Strike_box"] = true
	$"../../Flip/Strikebox/AnimationTree"["parameters/conditions/Empty"] = false
	
	
func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "agro retreat")

func hit():
	Transition.emit(self, "hit")
