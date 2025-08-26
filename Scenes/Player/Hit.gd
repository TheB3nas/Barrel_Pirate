extends State
class_name Player_Hit

var timer = 10

func Enter():
	timer = 10
	animation_tree["parameters/conditions/Idle"] = false
	#animation_tree["parameters/conditions/Turn"] = false
	animation_tree["parameters/conditions/Walk"] = false
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Hit"] = true
	animation_tree["parameters/conditions/Dead"] = false

func Update(_delta: float):
	if timer > 0:
		timer -= 1
	else:
		if entity.hit_points <= 0:
			Transition.emit(self, "dead")
		else:
			Transition.emit(self, "idle")

func hit():
	pass
