extends State

class_name Player_Walk

func Enter():
	animation_tree["parameters/conditions/Idle"] = false
	#animation_tree["parameters/conditions/Turn"] = false
	animation_tree["parameters/conditions/Walk"] = true
	animation_tree["parameters/conditions/Shoot"] = false
	animation_tree["parameters/conditions/Hit"] = false

func Update(_delta: float):
	if entity.shoot_direction and entity.can_shoot:
		Transition.emit(self, "shooting")
	elif entity.velocity == Vector2.ZERO:
		Transition.emit(self, "idle")

func hit():
	Transition.emit(self, "hit")
