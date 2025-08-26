extends State
class_name Bombling_Deagro_

var timer: int

func Enter():
	timer = 20
	entity.can_move = false
	animation_tree["parameters/conditions/Walk_fire"] = false
	animation_tree["parameters/conditions/Idle"] = false
	animation_tree["parameters/conditions/Agro"] = false
	animation_tree["parameters/conditions/deagro"] = true
	animation_tree["parameters/conditions/Hit_fire"] = false
	animation_tree["parameters/conditions/Fuse"] = false


func Update(delta):
	if timer > 0:
		timer -= delta
	else:
		Transition.emit(self, "idle")

func hit():
	Transition.emit(self, "hit no fire")
